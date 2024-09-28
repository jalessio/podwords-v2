class DropEpisodesEnclosureDuration < ActiveRecord::Migration[7.2]
  def change
    remove_column :episodes, :enclosure_duration # standard:disable Rails/ReversibleMigration
  end
end
