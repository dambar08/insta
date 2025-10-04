class AddAllowCommentToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :allow_comment, :boolean, null: false, default: true
  end
end
