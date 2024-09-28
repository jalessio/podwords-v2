class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.integer :feed_category_id
      t.string :feed_category
      t.timestamps
    end
  end
end
