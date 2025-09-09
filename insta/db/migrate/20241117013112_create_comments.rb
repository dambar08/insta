# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table(:comments) do |t|
      t.text(:body_plain)
      t.bigint(:commentable_id)
      t.string(:commentable_type)
      t.text(:caption)
      t.timestamps
    end

    add_index(:comments, [:commentable_id, :commentable_type])
  end
end
