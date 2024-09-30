class FeedFetcherHighPriorityJob
  include Sidekiq::Job
  sidekiq_options retry: 1, queue: "default"

  def perform(feed_id)
    feed = Feed.find(feed_id)
    feed.sync_episodes
  end
end
