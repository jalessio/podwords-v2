class AddTitleToFeed < ActiveRecord::Migration[7.2]
  def change
    add_column :feeds, :title, :string
    add_index :feeds, :title
  end
end
