class CreateTranscripts < ActiveRecord::Migration[7.2]
  def change
    create_table :transcripts do |t|
      t.jsonb :transcript, null: false, default: {}
      t.timestamps
    end

    add_index :transcripts, :transcript, using: :gin
  end
end
