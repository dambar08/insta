# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table(:accounts) do |t|
      t.string(:username)
      t.string(:firstname)
      t.string(:lastname)
      t.timestamps
    end

    add_index(:accounts, :username, unique: true)
  end
end
