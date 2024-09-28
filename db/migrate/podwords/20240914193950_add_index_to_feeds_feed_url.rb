class AddIndexToFeedsFeedUrl < ActiveRecord::Migration[7.2]
  def change
    add_index :feeds, :feed_url
  end
end
