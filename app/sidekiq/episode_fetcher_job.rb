class EpisodeFetcherJob
  include Sidekiq::Job

  def perform(episode_id)
    Episode.find(episode_id)&.transcribe
  end
end
