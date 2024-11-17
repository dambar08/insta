# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table(:profiles) do |t|
      t.belongs_to(:user, index: true, foreign_key: true)
      t.string(:gender)
      t.string(:locale)
      t.timestamps
    end
  end
end
