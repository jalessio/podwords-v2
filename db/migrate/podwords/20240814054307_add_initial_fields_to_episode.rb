class AddInitialFieldsToEpisode < ActiveRecord::Migration[7.2]
  def change
    # Fields from https://api.podcastindex.org/api/1.0/episodes/byfeedid?id=75075&max=1&pretty
    # "items": [
    #   {
    #     "id": 16795088,
    #     "title": "\"Gotham\"",
    #     "link": "https:\/\/www.theincomparable.com\/batmanuniversity\/19\/",
    #     "description": "<p>Batman University is back in session! James Thomson and Nathan Alderman join Tony for a discussion of Fox\u2019s \u201cGotham.\u201d Tune in to hear our thoughts on how a half-baked comic book show was reborn into an unmissable train wreck.<\/p>\n<p>\"Gotham\"<\/p>\n<p>Tony Sindelar   with James Thomson and Nathan Alderman<\/p>\n\n  \n  <h3 >Referenced Works<\/h3>\n   \n    \n     \n     \n      <h4>\n       Gotham\n       \n       \n      <\/h4>\n     \n    \n   \n  \n  <h3 >Show Notes & Links<\/h3>\n  \n  \n \n \n  ",
    #     "guid": "incomparable\/batman\/19b",
    #     "datePublished": 1546399813,
    #     "datePublishedPretty": "January 01, 2019 9:30pm",
    #     "dateCrawled": 1720021347,
    #     "enclosureUrl": "https:\/\/dts.podtrac.com\/redirect.mp3\/www.theincomparable.com\/podcast\/batmanuniversity302.mp3",
    #     "enclosureType": "audio\/mp3",
    #     "enclosureLength": 26385472,
    #     "duration": 3297,
    #     "explicit": 0,
    #     "episode": 19,
    #     "episodeType": "full",
    #     "season": 3,
    #     "image": "",
    #     "feedItunesId": 1441923632,
    #     "feedUrl": "https:\/\/feeds.theincomparable.com\/batmanuniversity",
    #     "feedImage": "https:\/\/www.theincomparable.com\/imgs\/logos\/logo-batmanuniversity-3x.jpg",
    #     "feedId": 75075,
    #     "podcastGuid": "ac9907f2-a748-59eb-a799-88a9c8bfb9f5",
    #     "feedLanguage": "en-us",
    #     "feedDead": 0,
    #     "feedDuplicateOf": null,
    #     "chaptersUrl": null,
    #     "transcriptUrl": null
    #   }
    add_column :episodes, :feed_id, :integer
    add_column :episodes, :episode_id, :integer
    add_column :episodes, :episode_title, :string
    add_column :episodes, :episode_link, :string
    add_column :episodes, :episode_description, :string
    add_column :episodes, :episode_guid, :string
    add_column :episodes, :episode_date_published, :integer
    add_column :episodes, :episode_date_published_pretty, :string
    add_column :episodes, :episode_date_crawled, :integer
    add_column :episodes, :episode_enclosure_url, :string
    add_column :episodes, :episode_enclosure_type, :string
    add_column :episodes, :episode_enclosure_length, :integer
    add_column :episodes, :episode_duration, :integer
    add_column :episodes, :episode_explicit, :boolean
    add_column :episodes, :episode_episode, :integer
    add_column :episodes, :episode_episode_type, :string
    add_column :episodes, :episode_season, :integer
    add_column :episodes, :episode_image, :string
    add_column :episodes, :episode_feed_itunes_id, :integer
    add_column :episodes, :episode_feed_url, :string
    add_column :episodes, :episode_feed_image, :string
    add_column :episodes, :episode_feed_id, :integer
    add_column :episodes, :episode_podcast_guid, :string
    add_column :episodes, :episode_feed_language, :string
    add_column :episodes, :episode_feed_dead, :integer
    add_column :episodes, :episode_feed_duplicate_of, :string
    add_column :episodes, :episode_chapters_url, :string
    add_column :episodes, :episode_transcript_url, :string
  end
end
