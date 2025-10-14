class CreateVerificationRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :verification_requests do |t|
      t.references :account, null: false, foreign_key: true, index: true
      t.string :status, null: false, default: "pending"
      t.text :note
      t.jsonb :metadata, default: {}
      t.timestamps
    end

    add_column :accounts, :verified, :boolean, default: false, null: false
    add_index :accounts, :verified
  end
end
