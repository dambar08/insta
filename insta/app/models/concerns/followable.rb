# frozen_string_literal: true

module Followable
  extend ActiveSupport::Concern

  included do
    has_many :followings, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  end

  def followers_count
    followings.unblocked.count
  end

  # Returns the followers by a given type
  def followers_by_type(follower_type, options = {})
    follows = follower_type.constantize
      .joins(:follows)
      .where("follows.blocked" => false,
        "follows.followable_id"   => id,
        "follows.followable_type" => parent_class_name(self),
        "follows.follower_type"   => follower_type)
    if options.has_key?(:limit)
      follows = follows.limit(options[:limit])
    end
    if options.has_key?(:includes)
      follows = follows.includes(options[:includes])
    end
    follows
  end

  def followers_by_type_count(follower_type)
    followings.unblocked.for_follower_type(follower_type).count
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

  # Returns true if the current instance is followed by the passed record
  # Returns false if the current instance is blocked by the passed record or no follow is found
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

  DEFAULT_PARENTS = [ApplicationRecord, ActiveRecord::Base]

  # Retrieves the parent class name if using STI.
  def parent_class_name(obj)
    unless parent_classes.include?(obj.class.superclass)
      return obj.class.base_class.name
    end

    obj.class.name
  end

  def apply_options_to_scope(scope, options = {})
    if options.has_key?(:limit)
      scope = scope.limit(options[:limit])
    end
    if options.has_key?(:includes)
      scope = scope.includes(options[:includes])
    end
    if options.has_key?(:joins)
      scope = scope.joins(options[:joins])
    end
    if options.has_key?(:where)
      scope = scope.where(options[:where])
    end
    if options.has_key?(:order)
      scope = scope.order(options[:order])
    end
    scope
  end

  def parent_classes
    return DEFAULT_PARENTS unless ActsAsFollower.custom_parent_classes.present?

    ActiveSupport::Deprecation.warn("Setting custom parent classes is deprecated and will be removed in future versions.")
    ActsAsFollower.custom_parent_classes + DEFAULT_PARENTS
  end
end
