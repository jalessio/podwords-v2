# require "fileutils"

# == Schema Information
#
# Table name: feeds
#
#  id         :integer          not null, primary key
#  feed_title :string
#  feed_url   :string
#  language   :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  feed_id    :integer
#
# Indexes
#
#  index_feeds_on_feed_id   (feed_id)
#  index_feeds_on_feed_url  (feed_url)
#
class Feed < ApplicationRecord
  has_many :episodes, dependent: :destroy
  # has_one :feeds_of_interest

  CRAWLER_USER_AGENT = "podwordsbot/0.0.1 podwords"

  def self.initialize_from_podcasts_table(feed_id)
    feed = Feed.find_or_create_by(feed_id: feed_id)
    podcast = PodcastIndexPodcast.find(feed_id)
    feed.feed_url = podcast.url
    feed.title = podcast.title
    feed.save!
  end

  def get_feed
    Rails.logger.info("Fetching feed: #{feed_url}")
    options = {
      follow_redirects: true, # Ensure that redirects are followed
      limit: 10, # Increase the limit to 10 redirects
      headers: {
        "User-Agent": CRAWLER_USER_AGENT
      },
      timeout: 10
    }
    @xml ||= HTTParty.get(feed_url, options).body
  end

  def parsed_feed
    @parsed_feed ||= Feedjira.parse(get_feed)
  end

  def sync_episodes(update_existing_records = false)
    # Update some fields on the Feed that we discover while syncing episodes
    update_attribute(:language, parsed_feed.language) if language.nil?
    update_attribute(:title, parsed_feed.title) if title.nil?

    # Loop through every episode in the feed
    parsed_feed.entries.each do |entry|
      episode_hash = {
        content: entry.content,
        enclosure_length: entry.enclosure_length,
        enclosure_type: entry.enclosure_type,
        enclosure_url: entry.enclosure_url,
        guid: entry.entry_id,
        image_link: entry.try(:image_link) || nil,
        image_title: entry.try(:image_title) || nil,
        image_url: entry.try(:image_url) || nil,
        itunes_block: entry.try(:itunes_block) || nil,
        itunes_duration: entry.try(:itunes_duration) || nil,
        itunes_episode_type: entry.try(:itunes_episode_type) || nil,
        itunes_explicit: entry.try(:itunes_explicit) || nil,
        itunes_image: entry.try(:itunes_image) || nil,
        itunes_title: entry.try(:itunes_title) || nil,
        published_at: entry.try(:published) || nil,
        summary: entry.try(:summary) || nil,
        title: entry.try(:title) || nil,
        url: entry.try(:url) || nil,
        itunes_episode_id: entry.try(:itunes_episode_id) || nil
      }

      # If we already have a record with this guid then and we're not "updating existing" then
      # we can skip writing to the the feeds table.
      episode = episodes.find_by(guid: episode_hash[:guid])

      if episode
        if update_existing_records
          episode.update!(episode_hash)
        end
      else
        episode = episodes.create(episode_hash)
      end
      # I wanted to defer all of this logic to an async job but it's just causing
      # millions of unncessary jobs to be created which ultimately just end up
      # calling "if episode.should_transcribe?" with a lot of extra overhead.
      EpisodeFetcherJob.perform_async(episode.id) if episode.should_transcribe?
    end
  end

  def is_english?
    language.downcase == "en" || language.downcase == "en-us"
  end

  def is_of_interest?
    feeds_of_interest.present?
  end
end
