# frozen_string_literal: true

class AddFollowersCountToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column(:accounts, :followers_count, :bigint, default: 0)
  end
end
