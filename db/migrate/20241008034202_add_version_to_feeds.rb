class AddVersionToFeeds < ActiveRecord::Migration[7.2]
  def change
    add_column :feeds, :version, :string
  end
end
