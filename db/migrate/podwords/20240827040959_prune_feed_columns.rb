class PruneFeedColumns < ActiveRecord::Migration[7.2]
  def change
    remove_column :feeds, :feed_artwork # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_author # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_chash # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_content_type # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_crawl_errors # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_dead # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_description # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_episode_count # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_explicit # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_generator # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_image # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_image_url_hash # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_itunes_type # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_language # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_last_crawl_time # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_last_good_http_status_time # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_last_http_status # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_last_update_time # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_link # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_locked # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_medium # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_original_url # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_owner_name # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_parse_errors # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_podcast_guid # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_type # standard:disable Rails/ReversibleMigration
    remove_column :feeds, :feed_itunes_id # standard:disable Rails/ReversibleMigration
  end
end
