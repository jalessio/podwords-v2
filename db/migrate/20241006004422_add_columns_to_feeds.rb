class AddColumnsToFeeds < ActiveRecord::Migration[7.2]
  def change
    add_column :feeds, :description, :text
    add_column :feeds, :link, :string
    add_column :feeds, :copyright, :string
    add_column :feeds, :image_url, :string
    add_column :feeds, :image_title, :string
    add_column :feeds, :image_link, :string
    add_column :feeds, :itunes_explicit, :boolean
    add_column :feeds, :itunes_type, :string
    add_column :feeds, :itunes_subtitle, :string
    add_column :feeds, :itunes_author, :string
    add_column :feeds, :itunes_summary, :text
    add_column :feeds, :itunes_owner_name, :string
    add_column :feeds, :itunes_owner_email, :string
    add_column :feeds, :itunes_image, :string
  end
end
