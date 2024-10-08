class AddEpisodeIdToTranscripts < ActiveRecord::Migration[7.2]
  def change
    add_column :transcripts, :episode_id, :integer
    add_index :transcripts, :episode_id
  end
end
