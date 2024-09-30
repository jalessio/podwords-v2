class EpisodeSyncAllJob
  include Sidekiq::Job

  def perform
    Feed.find_in_batches do |batch|
      ids = batch.map(&:id).zip
      FeedFetcherLowPriorityJob.perform_bulk(ids)
    end
  end
end
