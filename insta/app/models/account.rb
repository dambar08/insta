# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  firstname  :string
#  lastname   :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_accounts_on_username  (username) UNIQUE
#
class Account < ApplicationRecord
  include Followable
  include Follower
  include Accounts::Avatar
  include Accounts::Counters

  USERNAME_RE   = /[a-z0-9_]+([.-]+[a-z0-9_]+)*/i
  MENTION_RE    = %r{(?<![=/[:word:]])@((#{USERNAME_RE})(?:@[[:word:]]+([.-]+[[:word:]]+)*)?)}
  URL_PREFIX_RE = %r{\Ahttp(s?)://[^/]+}
  USERNAME_ONLY_RE = /\A#{USERNAME_RE}\z/i
  USERNAME_LENGTH_LIMIT = 30
  DISPLAY_NAME_LENGTH_LIMIT = 30
  NOTE_LENGTH_LIMIT = 500

  belongs_to :user, inverse_of: :account
  has_many :account_pins inverse_of: :account, dependent: :delete_all
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

  scope :recent, -> { reorder(id: :desc) }
  scope :with_username, ->(value) { where(arel_table[:username].lower.eq(value.to_s.downcase)) }

  validates :username, presence: true, length: { in: 2..30 }, uniqueness: true

  before_validation :set_username
  after_create_commit :send_welcome_notification

  def send_welcome_notification
    # TODO
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
end
