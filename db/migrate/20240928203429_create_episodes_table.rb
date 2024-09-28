class CreateEpisodesTable < ActiveRecord::Migration[7.2]
  def change
    create_table "episodes", force: :cascade do |t|
      t.integer "feed_id"
      t.string "title"
      t.string "guid"
      t.text "enclosure_url"
      t.integer "enclosure_length"
      t.string "enclosure_type"
      t.text "url"
      t.string "image_url"
      t.string "image_link"
      t.string "image_title"
      t.text "content"
      t.text "summary"
      t.datetime "published_at"
      t.boolean "itunes_block"
      t.integer "itunes_duration"
      t.integer "itunes_episode_id"
      t.string "itunes_episode_type"
      t.string "itunes_explicit"
      t.text "itunes_image"
      t.string "itunes_title"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["feed_id"], name: "index_episodes_on_feed_id"
      t.index ["guid"], name: "index_episodes_on_guid"
    end
  end
end
