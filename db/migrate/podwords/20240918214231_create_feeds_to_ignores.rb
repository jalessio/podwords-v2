class CreateFeedsToIgnores < ActiveRecord::Migration[7.2]
  def change
    create_table :feeds_to_ignores do |t|
      t.references :feed, null: false
      t.timestamps
    end
  end
end
