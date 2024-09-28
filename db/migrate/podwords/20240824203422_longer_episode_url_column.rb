class LongerEpisodeUrlColumn < ActiveRecord::Migration[7.2]
  def change
    change_column :episodes, :url, :text # standard:disable Rails/ReversibleMigration
  end
end
