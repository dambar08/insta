# frozen_string_literal: true

module Follower
  extend ActiveSupport::Concern

  included do
    has_many :followers, class_name: "Follow", foreign_key: "following_id", dependent: :destroy
  end

  # Returns true if this instance is following the object passed as an argument.
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

  private

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
