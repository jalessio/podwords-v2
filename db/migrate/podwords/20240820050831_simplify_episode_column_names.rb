class SimplifyEpisodeColumnNames < ActiveRecord::Migration[7.2]
  def change
    # Drop the existing episodes table
    drop_table :episodes # standard:disable Rails/ReversibleMigration

    # Recreate the episodes table with simplified column names
    create_table :episodes do |t|
      # Foreign key to feeds table
      t.integer :feed_id

      # Episode level fields
      t.string :title
      t.string :guid
      t.string :enclosure_url
      t.integer :enclosure_length
      t.string :enclosure_type
      t.string :url
      t.string :image_url
      t.string :image_link
      t.string :image_title
      t.text :content
      t.text :summary
      t.datetime :published_at # this is just "published" in FeedJira, but I want the "_at"

      # Grouping all Episode the "itunes_" prefixed fields together
      t.boolean :itunes_block
      t.integer :itunes_duration
      t.integer :itunes_episode_id
      t.string :itunes_episode_type
      t.string :itunes_explicit
      t.string :itunes_image
      t.string :itunes_title

      # Feed level fields
      t.string :feed_url
      t.string :feed_link
      t.string :feed_image
      t.string :feed_description
      t.string :feed_copyright
      t.string :feed_itunes_author
      t.string :feed_itunes_block
      t.string :feed_itunes_image
      t.string :feed_itunes_owners
      t.string :feed_itunes_type
      t.string :feed_language

      t.timestamps
    end
  end
end
