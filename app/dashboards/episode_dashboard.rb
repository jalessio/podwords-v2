require "administrate/base_dashboard"

class EpisodeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    # See https://discord.com/channels/874684608686477352/1181322818038800435/1181329057007280238
    # for instructions on how to use ActiveStorage fields
    audio_file_archive: Field::ActiveStorage,
    content: Field::Text,
    enclosure_length: Field::Number,
    enclosure_type: Field::String,
    enclosure_url: Field::Text,
    feed: Field::BelongsTo,
    guid: Field::String,
    image_link: Field::String,
    image_title: Field::String,
    image_url: Field::String,
    itunes_block: Field::Boolean,
    itunes_duration: Field::Number,
    itunes_episode_id: Field::Number,
    itunes_episode_type: Field::String,
    itunes_explicit: Field::String,
    itunes_image: Field::Text,
    itunes_title: Field::String,
    published_at: Field::DateTime,
    summary: Field::Text,
    title: Field::String,
    transcript: Field::HasOne,
    # See https://discord.com/channels/874684608686477352/1181322818038800435/1181329057007280238
    # for instructions on how to use ActiveStorage fields
    transcript_json_archive: Field::ActiveStorage,
    url: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    audio_file_archive
    content
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    audio_file_archive
    content
    enclosure_length
    enclosure_type
    enclosure_url
    feed
    guid
    image_link
    image_title
    image_url
    itunes_block
    itunes_duration
    itunes_episode_id
    itunes_episode_type
    itunes_explicit
    itunes_image
    itunes_title
    published_at
    summary
    title
    transcript
    transcript_json_archive
    url
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    audio_file_archive
    content
    enclosure_length
    enclosure_type
    enclosure_url
    feed
    guid
    image_link
    image_title
    image_url
    itunes_block
    itunes_duration
    itunes_episode_id
    itunes_episode_type
    itunes_explicit
    itunes_image
    itunes_title
    published_at
    summary
    title
    transcript
    transcript_json_archive
    url
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how episodes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(episode)
  #   "Episode ##{episode.id}"
  # end
end
