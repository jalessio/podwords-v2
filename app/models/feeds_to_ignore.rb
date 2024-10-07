# == Schema Information
#
# Table name: feeds_to_ignores
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  feed_id    :bigint           not null
#
# Indexes
#
#  index_feeds_to_ignores_on_feed_id  (feed_id)
#
class FeedsToIgnore < ApplicationRecord
  has_one :feed
end
