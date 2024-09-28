class CreateFeedsOfInterests < ActiveRecord::Migration[7.2]
  def change
    create_table :feeds_of_interests do |t|
      t.references :feed, null: false
      t.timestamps
    end
  end
end
