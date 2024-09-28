class AddIndexFeedFeedTitle < ActiveRecord::Migration[7.2]
  def change
    add_index :feeds, :feed_title
  end
end
