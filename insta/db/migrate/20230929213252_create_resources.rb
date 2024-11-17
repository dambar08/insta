# frozen_string_literal: true

class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table(:resources) do |t|
      t.string(:type)
      t.string(:temporary_url)
      t.string(:original_url)
      t.datetime(:deleted_at)
      t.timestamps
    end
  end
end
