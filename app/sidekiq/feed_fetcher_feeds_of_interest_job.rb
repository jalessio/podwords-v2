class FeedFetcherFeedsOfInterestJob
  include Sidekiq::Job

  def perform(*args)
    FeedsOfInterest.all.shuffle.each do |feed_of_interest|
      FeedFetcherJob.perform_async(feed_of_interest.feed_id)
    end
  end
end
