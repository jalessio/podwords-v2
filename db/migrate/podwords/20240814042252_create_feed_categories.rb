class CreateFeedCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :feed_categories do |t|
      t.integer :feed_id
      t.integer :feed_category_id
      t.timestamps
    end
  end
end
