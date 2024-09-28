class AddInitialFieldsToFeed < ActiveRecord::Migration[7.2]
  def change
    # Fields from https://api.podcastindex.org/api/1.0/podcasts/byfeedid?id=75075&pretty
    #
    # "feed": {
    #   "id": 75075,
    #   "podcastGuid": "ac9907f2-a748-59eb-a799-88a9c8bfb9f5",
    #   "medium": "podcast",
    #   "title": "Batman University",
    #   "url": "https://feeds.theincomparable.com/batmanuniversity",
    #   "originalUrl": "https://feeds.theincomparable.com/batmanuniversity",
    #   "link": "https://www.theincomparable.com/batmanuniversity/",
    #   "description": "Batman University is a seasonal podcast about you know who. It began with an analysis of episodes of "Batman: The Animated Series" but has now expanded to cover other series, movies, and media. Your professor is Tony Sindelar.",
    #   "author": "Tony Sindelar",
    #   "ownerName": "",
    #   "image": "https://www.theincomparable.com/imgs/logos/logo-batmanuniversity-3x.jpg",
    #   "artwork": "https://www.theincomparable.com/imgs/logos/logo-batmanuniversity-3x.jpg",
    #   "lastUpdateTime": 1723076228,
    #   "lastCrawlTime": 1723076214,
    #   "lastParseTime": 1723076235,
    #   "lastGoodHttpStatusTime": 1723076214,
    #   "lastHttpStatus": 200,
    #   "contentType": "application/rss+xml",
    #   "itunesId": 1441923632,
    #   "itunesType": "episodic",
    #   "generator": "",
    #   "language": "en-us",
    #   "explicit": false,
    #   "type": 0,
    #   "dead": 0,
    #   "chash": "ed64720535344a064bc82e1cec3de9a2",
    #   "episodeCount": 19,
    #   "crawlErrors": 0,
    #   "parseErrors": 0,
    #   "categories": {
    #     "104": "Tv",
    #     "105": "Film",
    #     "107": "Reviews"
    #   },
    #   "locked": 0,
    #   "imageUrlHash": 1702747127
    # },
    add_column :feeds, :feed_id, :integer
    add_column :feeds, :feed_podcast_guid, :string
    add_column :feeds, :feed_medium, :string
    add_column :feeds, :feed_title, :string
    add_column :feeds, :feed_url, :string
    add_column :feeds, :feed_original_url, :string
    add_column :feeds, :feed_link, :string
    add_column :feeds, :feed_description, :text
    add_column :feeds, :feed_author, :string
    add_column :feeds, :feed_owner_name, :string
    add_column :feeds, :feed_image, :string
    add_column :feeds, :feed_artwork, :string
    add_column :feeds, :feed_image_url_hash, :string
    add_column :feeds, :feed_last_update_time, :integer
    add_column :feeds, :feed_last_crawl_time, :integer
    add_column :feeds, :feed_last_good_http_status_time, :integer
    add_column :feeds, :feed_last_http_status, :integer
    add_column :feeds, :feed_content_type, :string
    add_column :feeds, :feed_itunes_id, :integer
    add_column :feeds, :feed_itunes_type, :string
    add_column :feeds, :feed_generator, :string
    add_column :feeds, :feed_language, :string
    add_column :feeds, :feed_explicit, :boolean
    add_column :feeds, :feed_type, :integer
    add_column :feeds, :feed_dead, :integer
    add_column :feeds, :feed_locked, :integer
    add_column :feeds, :feed_chash, :string
    add_column :feeds, :feed_episode_count, :integer
    add_column :feeds, :feed_crawl_errors, :integer
    add_column :feeds, :feed_parse_errors, :integer
  end
end
