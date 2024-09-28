class CreateFeedsOfInterestAndIgnoreTables < ActiveRecord::Migration[7.2]
  def change
    create_table "feeds_of_interests", force: :cascade do |t|
      t.bigint "feed_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["feed_id"], name: "index_feeds_of_interests_on_feed_id"
    end

    create_table "feeds_to_ignores", force: :cascade do |t|
      t.bigint "feed_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["feed_id"], name: "index_feeds_to_ignores_on_feed_id"
    end
  end
end
