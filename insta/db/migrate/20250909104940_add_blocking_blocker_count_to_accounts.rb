# frozen_string_literal: true

class AddBlockingBlockerCountToAccounts < ActiveRecord::Migration[7.2]
  def change
    add_column(:accounts, :blocked_by_count, :bigint, default: 0, null: false)
    add_column(:accounts, :blocking_others_count, :bigint, default: 0, null: false)
  end
end
