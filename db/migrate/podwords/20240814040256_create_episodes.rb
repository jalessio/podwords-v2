class CreateEpisodes < ActiveRecord::Migration[7.2]
  def change
    create_table :episodes do |t|
      t.timestamps
    end
  end
end
