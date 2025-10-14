# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                    :bigint           not null, primary key
#  blocked_by_count      :bigint           default(0), not null
#  blocking_others_count :bigint           default(0), not null
#  firstname             :string
#  followers_count       :bigint           default(0)
#  followings_count      :bigint           default(0)
#  last_post_at          :datetime
#  lastname              :string
#  posts_count           :integer          default(0), not null
#  username              :string
#  verified              :boolean          default(FALSE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :bigint
#
# Indexes
#
#  index_accounts_on_last_post_at_and_id  (last_post_at DESC,id) WHERE (last_post_at IS NOT NULL)
#  index_accounts_on_user_id              (user_id)
#  index_accounts_on_username             (username) UNIQUE
#  index_accounts_on_verified             (verified)
#
class Account < ApplicationRecord
  include Accounts::Avatar

  acts_as_followable
  acts_as_follower

  USERNAME_RE   = /[a-z0-9_]+([.-]+[a-z0-9_]+)*/i
  MENTION_RE    = %r{(?<![=/[:word:]])@((#{USERNAME_RE})(?:@[[:word:]]+([.-]+[[:word:]]+)*)?)}
  URL_PREFIX_RE = %r{\Ahttp(s?)://[^/]+}
  USERNAME_ONLY_RE = /\A#{USERNAME_RE}\z/i
  USERNAME_LENGTH_LIMIT = 30
  DISPLAY_NAME_LENGTH_LIMIT = 30
  NOTE_LENGTH_LIMIT = 500

  has_one :setting, dependent: :destroy
  belongs_to :user, inverse_of: :account, dependent: :destroy
  has_many :posts, inverse_of: :account, dependent: :destroy
  has_many :account_pins, inverse_of: :account, dependent: :delete_all
  has_many :notifications, inverse_of: :account, dependent: :delete_all
  has_many :bookmarks, inverse_of: :accountable, dependent: :delete_all
  has_many :blocked_blocks,
    class_name: "AccountBlock",
    foreign_key: :blocked_id,
    inverse_of: :blocked,
    dependent: :delete_all
  has_many :blocker_blocks,
    class_name: "AccountBlock",
    foreign_key: :blocker_id,
    inverse_of: :blocker,
    dependent: :delete_all

  has_many :issues, inverse_of: :account, dependent: :destroy
  has_many :verification_requests, inverse_of: :account, dependent: :destroy
  has_many :assets, as: :viewable, inverse_of: :viewable, dependent: :destroy

  delegate :email, to: :user

  scope :recent, -> { reorder(id: :desc) }
  scope :with_username, ->(value) { where(arel_table[:username].lower.eq(value.to_s.downcase)) }

  validates :username, presence: true, length: { in: 2..30 }, uniqueness: true
  validates :user_id, uniqueness: true
  validates :followers_count, presence: true
  validates :followings_count, presence: true
  validates :blocked_by_count, presence: true
  validates :blocking_others_count, presence: true

  before_validation :set_username
  after_create_commit :send_welcome_notification

  def send_welcome_notification
    # TODO
  end

  def fullname
    [firstname, lastname].compact.join(" ")
  end

  def set_username
    self.username = username&.downcase.presence || generate_username
  end

  def generate_username
    loop do
      username = Random.hex(15)
      break username unless self.class.exists?(username: username)
    end
  end

  def following_accounts
    following_by_type(self.class.name)
  end

  def follower_accounts
    followers_by_type(self.class.name)
  end
end
