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
  has_many :account_pins, inverse_of: :account, dependent: :delete_all
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

  def followers_count
    followings.unblocked.count
  end

  def blocked_followers_count
    followings.blocked.count
  end

  # Returns the followings records scoped
  def followers_scoped
    followings.includes(:follower)
  end

  def followers(options = {})
    followers_scope = followers_scoped.unblocked
    followers_scope = apply_options_to_scope(followers_scope, options)
    followers_scope.to_a.collect { |f| f.follower }
  end

  def blocks(options = {})
    blocked_followers_scope = followers_scoped.blocked
    blocked_followers_scope = apply_options_to_scope(blocked_followers_scope, options)
    blocked_followers_scope.to_a.collect { |f| f.follower }
  end

  def followed_by?(follower)
    followings.unblocked.for_follower(follower).first.present?
  end

  def block(follower)
    get_follow_for(follower) ? block_existing_follow(follower) : block_future_follow(follower)
  end

  def unblock(follower)
    get_follow_for(follower).try(:delete)
  end

  def get_follow_for(follower)
    followings.for_follower(follower).first
  end

  private

  def block_future_follow(follower)
    Follow.create(followable: self, follower: follower, blocked: true)
  end

  def block_existing_follow(follower)
    get_follow_for(follower).block!
  end

  def following?(followable)
    0 < Follow.unblocked.for_follower(self).for_followable(followable).count
  end

  # Returns the number of objects this instance is following.
  def follow_count
    Follow.unblocked.for_follower(self).count
  end

  # Creates a new follow record for this instance to follow the passed object.
  # Does not allow duplicate records to be created.
  def follow(followable)
    if self != followable
      params = { followable_id: followable.id, followable_type: parent_class_name(followable) }
      follows.create_or_find_by!(params)
    end
  end

  # Deletes the follow record if it exists.
  def stop_following(followable)
    if follow = get_follow(followable)
      follow.destroy
    end
  end

  # returns the follows records to the current instance
  def follows_scoped
    follows.unblocked.includes(:followable)
  end

  # Returns the follow records related to this instance by type.
  def follows_by_type(followable_type, options = {})
    follows_scope = follows_scoped.for_followable_type(followable_type)
    apply_options_to_scope(follows_scope, options)
  end

  # Returns the follow records related to this instance with the followable included.
  def all_follows(options = {})
    follows_scope = follows_scoped
    apply_options_to_scope(follows_scope, options)
  end

  # Returns the actual records which this instance is following.
  def all_following(options = {})
    all_follows(options).collect { |f| f.followable }
  end

  # Returns the actual records of a particular type which this record is following.
  def following_by_type(followable_type, options = {})
    followables = followable_type.constantize
      .joins(:followings)
      .where("follows.blocked" => false,
        "follows.follower_id"     => id,
        "follows.follower_type"   => parent_class_name(self),
        "follows.followable_type" => followable_type)
    if options.has_key?(:limit)
      followables = followables.limit(options[:limit])
    end
    if options.has_key?(:includes)
      followables = followables.includes(options[:includes])
    end
    followables
  end

  def following_by_type_count(followable_type)
    follows.unblocked.for_followable_type(followable_type).count
  end

  # Returns a follow record for the current instance and followable object.
  def get_follow(followable)
    follows.unblocked.for_followable(followable).first
  end
end
