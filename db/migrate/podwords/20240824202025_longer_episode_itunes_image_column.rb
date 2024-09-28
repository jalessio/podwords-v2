class LongerEpisodeItunesImageColumn < ActiveRecord::Migration[7.2]
  def change
    change_column :episodes, :itunes_image, :text # standard:disable Rails/ReversibleMigration
  end
end
