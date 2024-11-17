class CreateAccountStats < ActiveRecord::Migration[7.2]
  def change
    create_table :account_stats do |t|
      t.belongs_to(:account, foreign_key: true, null: false)
      t.bigint(:posts_count, default: 0, null: false)
      t.bigint(:following_count, default: 0, null: false)
      t.bigint(:followers_count, default: 0, null: false)
      t.datetime :last_post_at
      t.timestamps
    end

    add_index :account_stats, [:last_post_at, :account_id], name: "index_account_stats_on_last_post_at_and_account_id", order: { last_post_at: :desc }, where: "last_post_at IS NOT NULL"
  end
end
