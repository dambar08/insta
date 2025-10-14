class AddAccountStatsToAcount < ActiveRecord::Migration[7.2]
  def change
    add_column :accounts, :last_post_at, :datetime
    add_column :accounts, :posts_count, :integer, default: 0, null: false
    add_index(:accounts, [:last_post_at, :id], order: { last_post_at: :desc }, where: "last_post_at IS NOT NULL")
  end
end
