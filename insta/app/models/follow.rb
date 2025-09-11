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
  FOLLOWABLE_TYPES = ["Account"].freeze
  FOLLOWER_TYPES = ["Account"].freeze

  has_one :notification, as: :notifiable, dependent: :destroy
  belongs_to :followable, polymorphic: true
  belongs_to :follower, polymorphic: true

  validates :follower_id, :follower_type, uniqueness: { scope: [:followable_id, :followable_type] }
  validates :follower_id, presence: true, if: :follower_type
  validates :followable_id, presence: true, if: :followable_type
  validates :follower_type, inclusion: { in: FOLLOWER_TYPES }, if: :follower_id
  validates :followable_type, inclusion: { in: FOLLOWABLE_TYPES }, if: :followable_id

  class << self
    def for_follower(follower)
      where(follower_id: follower.id, follower_type: parent_class_name(follower))
    end

    def for_followable(followable)
      where(followable_id: followable.id, followable_type: parent_class_name(followable))
    end

    def for_follower_type(follower_type)
      where(follower_type: follower_type)
    end

    def for_followable_type(followable_type)
      where(followable_type: followable_type)
    end

    def recent(from)
      where(["created_at > ?", (from || 2.weeks.ago).to_s(:db)])
    end

    def descending
      order("follows.created_at DESC")
    end

    def unblocked
      where(blocked: false)
    end

    def blocked
      where(blocked: true)
    end
  end
end
