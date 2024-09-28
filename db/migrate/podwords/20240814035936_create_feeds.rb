class CreateFeeds < ActiveRecord::Migration[7.2]
  def change
    create_table :feeds do |t|
      t.timestamps
    end
  end
end
