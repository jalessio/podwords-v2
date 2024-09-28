class TrascriptionsRenameDuration < ActiveRecord::Migration[7.2]
  def change
    rename_column :transcripts, :duration_seconds, :whisper_duration_seconds
  end
end
