# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id             :bigint           not null, primary key
#  follower_type  :string           not null
#  following_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  follower_id    :bigint           not null
#  following_id   :bigint           not null
#
# Indexes
#
#  index_follows_on_follower_id_and_following_id  (follower_id,following_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#  fk_rails_...  (following_id => users.id)
#
class Follow < ApplicationRecord
  belongs_to :followable, polymorphic: true
  belongs_to :follower, polymorphic: true
end
