class AddFeedAndEpisodeIndexes < ActiveRecord::Migration[7.2]
  def change
    add_index :feeds, :feed_id
    add_index :episodes, :feed_id
  end
end
