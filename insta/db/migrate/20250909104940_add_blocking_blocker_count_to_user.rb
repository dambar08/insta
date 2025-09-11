# frozen_string_literal: true

class AddBlockingBlockerCountToUser < ActiveRecord::Migration[7.2]
  def change
    add_column(:users, :blocked_by_count, :bigint, default: 0, null: false)
    add_column(:users, :blocking_others_count, :bigint, default: 0, null: false)
  end
end
