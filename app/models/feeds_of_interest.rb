# == Schema Information
#
# Table name: feeds_of_interests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  feed_id    :integer          not null
#
# Indexes
#
#  index_feeds_of_interests_on_feed_id  (feed_id)
#
class FeedsOfInterest < ApplicationRecord
  belongs_to :feed
end
