class CreateTranscripts < ActiveRecord::Migration[7.2]
  def change
    create_table :transcripts do |t|
      t.integer :episode_id
      t.text :transcript
      t.timestamps
    end
  end
end
