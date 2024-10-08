class RenameTranscriptsTranscripts < ActiveRecord::Migration[7.2]
  def change
    rename_column :transcripts, :transcript, :payload
  end
end
