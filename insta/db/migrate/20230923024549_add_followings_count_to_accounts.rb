# frozen_string_literal: true

class AddFollowingsCountToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column(:accounts, :followings_count, :bigint, default: 0)
  end
end
