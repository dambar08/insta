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

  COUNTER_CULTURE_COLUMN_NAME_BY_TYPE = {
    "Account" => "followings_count",
  }.freeze

  COUNTER_CULTURE_COLUMNS_NAMES = {
    ["follows.followable_type = ?", "User"] => "followings_count",
  }.freeze

  FOLLOWABLE_TYPES = ["Account"].freeze
  FOLLOWER_TYPES = ["Account"].freeze

  has_one :notification, as: :notifiable, dependent: :destroy
  belongs_to :followable, polymorphic: true
  belongs_to :follower, polymorphic: true

  scope :followable_account, ->(id) { where(followable_id: id, followable_type: "Account") }
  scope :follower_account, ->(id) { where(follower_id: id, followable_type: "Account") }
  validates :follower_id, uniqueness: { scope: [:followable_id, :followable_type, :follower_type] }
  validates :follower_id, presence: true, if: :follower_type
  validates :followable_id, presence: true, if: :followable_type
  validates :blocked, inclusion: { in: [true, false] }
  validates :followable_type, presence: true
  validates :follower_type, presence: true
  validates :follower_type, inclusion: { in: FOLLOWER_TYPES }, if: :follower_id
  validates :followable_type, inclusion: { in: FOLLOWABLE_TYPES }, if: :followable_id

  counter_culture :follower,
    column_name: proc { |follow| COUNTER_CULTURE_COLUMN_NAME_BY_TYPE[follow.followable_type] },
    column_names: COUNTER_CULTURE_COLUMNS_NAMES

  private

  def increment_cache_counters
    followable&.increment_count!(:following_count)
    follower&.increment_count!(:followers_count)
  end

  def decrement_cache_counters
    followable&.decrement_count!(:following_count)
    follower&.decrement_count!(:followers_count)
  end
end
