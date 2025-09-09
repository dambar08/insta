# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table(:accounts) do |t|
      t.timestamps
    end
  end
end
