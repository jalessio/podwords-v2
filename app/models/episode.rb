# == Schema Information
#
# Table name: episodes
#
#  id                  :bigint           not null, primary key
#  content             :text
#  enclosure_length    :integer
#  enclosure_type      :string
#  enclosure_url       :text
#  guid                :string
#  image_link          :string
#  image_title         :string
#  image_url           :string
#  itunes_block        :boolean
#  itunes_duration     :integer
#  itunes_episode_type :string
#  itunes_explicit     :string
#  itunes_image        :text
#  itunes_title        :string
#  published_at        :datetime
#  summary             :text
#  title               :string
#  url                 :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  feed_id             :integer
#  itunes_episode_id   :integer
#
# Indexes
#
#  index_episodes_on_feed_id  (feed_id)
#  index_episodes_on_guid     (guid)
#
class Episode < ApplicationRecord
  include MeiliSearch::Rails

  belongs_to :feed
  has_one :transcript, dependent: :destroy
  has_one_attached :audio_file_archive
  has_one_attached :transcript_json_archive

  # While on the hosted Meilisearch instance, we will limit indexing
  # only to feeds_of_interest since we have 4M+ records to index otherwise.
  meilisearch if: :is_of_interest?, sanitize: true do
    attribute :title
    attribute :summary
  end

  # TODO:
  # -
  # NOTES:
  # - episode count 2024-09-11 117,226,161
  MAX_EPISODES = 1000
  TRANSCRIPT_DATE_CUTOFF = "2016-01-01"
  TRANSCRIPT_DURATION_CUTOFF = 8.hours.to_i

  def should_transcribe?
    FeedsOfInterest.where(id: feed_id).exists? \
      && FeedsToIgnore.where(id: feed_id).none? \
      && published_at > Time.zone.parse(TRANSCRIPT_DATE_CUTOFF) \
      && transcript.blank?
  end

  def transcribe
    # If the Feed is
    # - in the list of "Feeds of Interest"
    # - was published on or after a specific date
    # - it does not already have a transcription
    # then
    # - Save the audio file to R2
    # - Enqueue a job to transcribe it
    if should_transcribe?
      Rails.logger.info("FEED_TITLE: #{feed.title}")
      Rails.logger.info("FEED_LANGUAGE: #{feed.language}")
      Rails.logger.info("EPISODE_PUBLISHED_AT: #{published_at}")

      if !transcript_json_archive.attached?
        attach_audio_file if !audio_file_archive.attached?
        audio_file_archive.analyze if !audio_file_archive.analyzed?
        Rails.logger.info("EPISODE_DURATION: #{duration}")
        if duration <= TRANSCRIPT_DURATION_CUTOFF
          Rails.logger.info("TRANSCRIBING EPISODE: #{id}")
          TranscribeEnqueueJob.perform_async(id) # This uses SQS to enqueue a job for podwords-transcribe app to transcribe
        end
      end
    end
  end

  # Local path where the file will be saved
  def audio_file_name
    "#{id}.mp3"
  end

  def attach_audio_file
    if !audio_file_archive.attached?
      download_audio_file
      audio_file_archive.attach(
        io: File.open("/tmp/#{audio_file_name}"),
        filename: audio_file_name,
        key: audio_file_name
      )
      delete_audio_file_local
    end
  end

  # TODO:
  # - this is insane.. need to switch download_audio_file and attach_audio_file to use tmpdir
  def delete_audio_file_local
    File.delete("/tmp/#{audio_file_name}")
  end

  def download_audio_file
    options = {
      follow_redirects: true, # Ensure that redirects are followed
      limit: 10, # Increase the limit to 10 redirects
      headers: {
        "User-Agent": Feed::CRAWLER_USER_AGENT
      },
      timeout: 10
    }
    Rails.logger.info("Downloading #{enclosure_url}")
    response = HTTParty.get(enclosure_url, options)

    # Check if the response is successful
    if response.code == 200
      # Save the file to disk
      File.binwrite("/tmp/#{audio_file_name}", response.body)
      Rails.logger.info("File downloaded and saved to #{audio_file_name}")
    else
      Rails.logger.info("Failed to download file. HTTP Status Code: #{response.code}")
    end
  end

  def duration
    reuturn nil if !audio_file_archive.attached?

    # We need ActiveStorage to "analyze" the file in order to get duration
    audio_file_archive.analyze if !audio_file_archive.analyzed?
    audio_file_archive.metadata["duration"]
  end

  def duration_human
    return "" unless duration # TODO: This is terrible

    hours = duration / 3600
    minutes = (duration % 3600) / 60
    remaining_seconds = duration % 60

    if hours > 0
      format("%d hours, %02d minutes, %02d seconds", hours, minutes, remaining_seconds)
    else
      format("%d minutes, %02d seconds", minutes, remaining_seconds)
    end
  end

  def is_of_interest?
    feed.is_of_interest?
  end
end
