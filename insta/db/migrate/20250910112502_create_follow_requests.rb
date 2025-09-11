# frozen_string_literal: true

class CreateFollowRequests < ActiveRecord::Migration[7.2]
  def change
    create_table(:follow_requests) do |t|
      t.belongs_to(:account)
      t.belongs_to(:target_account, foreign_key: { to_table: :accounts })
      t.boolean(:notify, default: :false, null: false)
      t.timestamps
    end

    add_index(:follow_requests, [:account_id, :target_account_id], unique: true)
  end
end
