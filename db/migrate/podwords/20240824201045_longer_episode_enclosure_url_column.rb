class LongerEpisodeEnclosureUrlColumn < ActiveRecord::Migration[7.2]
  def change
    change_column :episodes, :enclosure_url, :text # standard:disable Rails/ReversibleMigration
  end
end
