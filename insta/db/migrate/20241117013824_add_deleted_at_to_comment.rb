class AddDeletedAtToComment < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :deleted_at, :datetime
    add_index :comments, :deleted_at
  end
end
