class FeedIndexJob
  include Sidekiq::Job

  def perform(id, remove = false)
    if remove
      # The record has likely already been removed from your database so we cannot
      # use ActiveRecord#find to load it.
      # We access the underlying Meilisearch index object.
      Feed.index.delete_document(id)
    else
      # The record should be present.
      Feed.find(id).index!
    end
  end
end
