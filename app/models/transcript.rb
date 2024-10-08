# == Schema Information
#
# Table name: transcripts
#
#  id         :bigint           not null, primary key
#  transcript :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  episode_id :integer
#
# Indexes
#
#  index_transcripts_on_episode_id  (episode_id)
#  index_transcripts_on_transcript  (transcript) USING gin
#
class Transcript < ApplicationRecord
  # include MeiliSearch::Rails

  belongs_to :episode
  # before_save :word_count

  # meilisearch do
  #   attribute :transcript
  # end

  # def word_count
  #   self.word_count = transcript.split(" ").count
  # end
end
