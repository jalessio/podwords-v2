class DropFeedColumnsFromEpisode < ActiveRecord::Migration[7.2]
  def change
    remove_column :episodes, :feed_copyright # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_description # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_image # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_itunes_author # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_itunes_block # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_itunes_image # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_itunes_owners # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_itunes_type # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_language # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_link # standard:disable Rails/ReversibleMigration
    remove_column :episodes, :feed_url # standard:disable Rails/ReversibleMigration
  end
end
