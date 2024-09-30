class FeedFetcherLowPriorityJob
  include Sidekiq::Job
  sidekiq_options retry: 1, queue: "within_1_day"

  def perform(feed_id)
    feed = Feed.find(feed_id)
    feed.sync_episodes
  end
end
