# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id              :bigint           not null, primary key
#  blocked         :boolean          default(FALSE), not null
#  followable_type :string           not null
#  follower_type   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  followable_id   :bigint           not null
#  follower_id     :bigint           not null
#
# Indexes
#
#  fk_followables                            (followable_id,followable_type)
#  fk_follows                                (follower_type,follower_id)
#  index_follows_on_created_at               (created_at)
#  index_follows_on_followable_and_follower  (followable_id,followable_type,follower_id,follower_type) UNIQUE
#
class Follow < ApplicationRecord
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  FOLLOWABLE_TYPES = ["Account"].freeze
  FOLLOWER_TYPES = ["Account"].freeze

  has_one :notification, as: :notifiable, dependent: :destroy
  belongs_to :followable, polymorphic: true
  belongs_to :follower, polymorphic: true

  validates :follower_id, uniqueness: { scope: [:followable_id, :followable_type, :follower_type] }
  validates :follower_id, presence: true, if: :follower_type
  validates :followable_id, presence: true, if: :followable_type
  validates :follower_type, inclusion: { in: FOLLOWER_TYPES }, if: :follower_id
  validates :followable_type, inclusion: { in: FOLLOWABLE_TYPES }, if: :followable_id
end
