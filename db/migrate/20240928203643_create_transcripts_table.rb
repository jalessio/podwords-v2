class CreateTranscriptsTable < ActiveRecord::Migration[7.2]
  def change
    create_table "transcripts", force: :cascade do |t|
      t.integer "episode_id"
      t.text "transcript"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "whisper_duration_seconds"
      t.integer "word_count"
      t.string "model_size", limit: 50
      t.string "device", limit: 10
      t.string "compute_type", limit: 10
      t.string "language", limit: 2
      t.integer "cpu_threads"
      t.integer "beam_size"
      t.index ["episode_id"], name: "index_transcripts_on_episode_id"
    end
  end
end
