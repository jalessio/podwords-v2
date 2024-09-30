class FeedFetcherFromUrlJob
  include Sidekiq::Job
  sidekiq_options retry: 1

  def perform(feed_url)
    feed = Feed.find_or_create_by(feed_url: feed_url)
    feed.sync_episodes
  end
end
