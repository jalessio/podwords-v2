class LongerEpisodeFeedDescriptionColumn < ActiveRecord::Migration[7.2]
  def change
    change_column :episodes, :feed_description, :text # standard:disable Rails/ReversibleMigration
  end
end
