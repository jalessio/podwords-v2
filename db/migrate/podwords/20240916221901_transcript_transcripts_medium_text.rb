class TranscriptTranscriptsMediumText < ActiveRecord::Migration[7.2]
  def change
    change_column :transcripts, :transcript, :mediumtext # standard:disable Rails/ReversibleMigration
  end
end
