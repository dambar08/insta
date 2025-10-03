class CreateBookmarks < ActiveRecord::Migration[7.2]
  def change
    create_table :bookmarks do |t|
      t.references :bookmarkable, polymorphic: true, null: false
      t.references :accountable, polymorphic: true, null: false
      t.timestamps
    end

    add_index :bookmarks, :created_at
    add_index :bookmarks, [:bookmarkable_id, :bookmarkable_type]
    add_index :bookmarks, [:accountable_id, :accountable_type]
    add_index :bookmarks, [:accountable_id, :accountable_type, :bookmarkable_id, :bookmarkable_type], unique: true
  end
end
