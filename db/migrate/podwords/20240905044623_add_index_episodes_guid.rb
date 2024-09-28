class AddIndexEpisodesGuid < ActiveRecord::Migration[7.2]
  def change
    add_index :episodes, :guid
  end
end
