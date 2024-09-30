class DeleteFeedsFeedTitle < ActiveRecord::Migration[7.2]
  def change
    remove_column :feeds, :feed_title
  end
end
