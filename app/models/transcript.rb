# == Schema Information
#
# Table name: transcripts
#
#  id         :bigint           not null, primary key
#  payload    :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  episode_id :integer
#
# Indexes
#
#  index_transcripts_on_episode_id  (episode_id)
#  index_transcripts_on_payload     (payload) USING gin
#
class Transcript < ApplicationRecord
  include MeiliSearch::Rails
  extend Pagy::Meilisearch
  belongs_to :episode
  after_save :trigger_search

  meilisearch enqueue: :trigger_sidekiq_index_job do
    attribute :full_text, :episode_id
    add_attribute :feed_id do
      episode.feed_id
    end
    displayed_attributes [:full_text]
  end

  def full_text
    payload["text"]
  end

  def trigger_search
  end

  def self.trigger_sidekiq_index_job(record, remove)
    TranscriptIndexJob.perform_async(record.id, remove)
  end
end
