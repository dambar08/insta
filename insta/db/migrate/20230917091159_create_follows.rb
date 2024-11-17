# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.0]
  def up
    create_table(:follows) do |t|
      t.bigint("follower_id", null: false)
      t.bigint("following_id", null: false)
      t.timestamps
    end
    add_foreign_key(:follows, :users, column: :follower_id)
    add_foreign_key(:follows, :users, column: :following_id)
    add_index(:follows, [:follower_id, :following_id], unique: true)
  end

  def down
    drop_table(:follows)
  end
end
