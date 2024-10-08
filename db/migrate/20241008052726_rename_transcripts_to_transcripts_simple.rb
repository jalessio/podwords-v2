class RenameTranscriptsToTranscriptsSimple < ActiveRecord::Migration[7.2]
  def change
    rename_table :transcripts, :transcripts_simple
  end
end
