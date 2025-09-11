# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.0]
  def up
    create_table(:follows) do |t|
      t.boolean("blocked", default: false, null: false)
      t.string("follower_type", null: false)
      t.bigint("follower_id", null: false)
      t.bigint("followable_id", null: false)
      t.string("followable_type", null: false)
      t.timestamps
    end
    add_index(:follows, [:followable_id, :followable_type, :follower_id, :follower_type], name: "index_follows_on_followable_and_follower", unique: true)
    add_index(:follows, :created_at)
    add_index(:follows, [:followable_id, :followable_type], name: "fk_followables")
    add_index(:follows, [:follower_type, :follower_id], name: "fk_follows")
  end

  def down
    drop_table(:follows)
  end
end
