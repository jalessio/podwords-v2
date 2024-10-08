# require "fileutils"

# == Schema Information
#
# Table name: feeds
#
#  id                 :bigint           not null, primary key
#  copyright          :string
#  description        :text
#  feed_url           :string
#  image_link         :string
#  image_title        :string
#  image_url          :string
#  itunes_author      :string
#  itunes_explicit    :boolean
#  itunes_image       :string
#  itunes_owner_email :string
#  itunes_owner_name  :string
#  itunes_subtitle    :string
#  itunes_summary     :text
#  itunes_type        :string
#  language           :string(10)
#  link               :string
#  title              :string
#  version            :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  feed_id            :integer
#
# Indexes
#
#  index_feeds_on_feed_id   (feed_id)
#  index_feeds_on_feed_url  (feed_url)
#  index_feeds_on_title     (title)
#
class Feed < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_one :feeds_of_interest
  has_one :feeds_to_ignore

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

  def update_feed
    update(
      language: parsed_feed&.language,
      title: parsed_feed&.title,
      description: parsed_feed&.description,
      link: parsed_feed&.url,
      copyright: parsed_feed&.copyright,
      version: parsed_feed&.version,
      image_url: parsed_feed&.image&.url,
      image_title: parsed_feed&.image&.title,
      image_link: parsed_feed&.image&.link,
      itunes_explicit: parsed_feed&.itunes_explicit,
      itunes_type: parsed_feed&.itunes_type,
      itunes_subtitle: parsed_feed&.itunes_subtitle,
      itunes_author: parsed_feed&.itunes_author,
      itunes_summary: parsed_feed&.itunes_summary,
      itunes_owner_name: parsed_feed&.itunes_owners&.[](0)&.name,
      itunes_owner_email: parsed_feed&.itunes_owners&.[](0)&.email,
      itunes_image: parsed_feed&.itunes_image
    )
  end

  def sync_episodes(update_existing_records = false)
    # We maintain a list of feeds that we don't want to sync in the database.
    # If the feed is in this list, we skip it.
    return if feeds_to_ignore.present?

    # Update the feed with the parsed feed info, which allows us to builds up
    # a more complete model of the feed as we add more fields to the Feed model.
    update_feed

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
