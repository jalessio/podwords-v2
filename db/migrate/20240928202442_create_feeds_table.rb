class CreateFeedsTable < ActiveRecord::Migration[7.2]
  def change
    create_table "feeds", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "feed_id"
      t.string "feed_title"
      t.string "feed_url"
      t.string "language", limit: 10
      t.string "title"
      t.index ["feed_id"], name: "index_feeds_on_feed_id"
      t.index ["feed_title"], name: "index_feeds_on_feed_title"
      t.index ["feed_url"], name: "index_feeds_on_feed_url"
      t.index ["title"], name: "index_feeds_on_title"
    end
  end
end
