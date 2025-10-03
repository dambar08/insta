class CreateIssues < ActiveRecord::Migration[7.2]
  def change
    create_table :issues do |t|
      t.text :description
      t.integer :status, default: 0, null: false
      t.belongs_to :account
      t.timestamps
    end

    add_index :issues, [:status]
  end
end
