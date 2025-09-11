# frozen_string_literal: true

class CreateAccountBlocks < ActiveRecord::Migration[7.2]
  def change
    create_table(:account_blocks) do |t|
      t.bigint(:blocker_id)
      t.bigint(:blocked_id)
      t.timestamps
    end

    add_index(:account_blocks, [:blocker_id, :blocked_id], unique: true)
  end
end
