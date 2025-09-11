# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  blocked_by_count       :bigint           default(0), not null
#  blocking_others_count  :bigint           default(0), not null
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  deleted_at             :datetime
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  followers_count        :bigint           default(0)
#  followings_count       :bigint           default(0)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :bigint
#
# Indexes
#
#  index_users_on_account_id            (account_id)
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  rolify strict: true
  # has_paper_trail versions: { class_name: "UserVersion" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  belongs_to :account, inverse_of: :user
  has_many :ahoy_events, class_name: "Ahoy::Event", dependent: :delete_all
  has_many :ahoy_visits, class_name: "Ahoy::Visit", dependent: :delete_all
  has_many :access_grants, class_name: "Doorkeeper::AccessGrant", foreign_key: :resource_owner_id, dependent: :delete_all # or :destroy if you need callbacks
  has_many :access_tokens, class_name: "Doorkeeper::AccessToken", foreign_key: :resource_owner_id, dependent: :delete_all # or :destroy if you need callbacks

  accepts_nested_attributes_for :account

  # has_many :folowings, through: :follows
  def age
    return unless dob

    @age ||= ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
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
