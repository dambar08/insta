class CreateCanonicalEmailBlocks < ActiveRecord::Migration[7.2]
  def change
    create_table :canonical_email_blocks do |t|
      t.string "canonical_email_hash", default: "", null: false
      t.bigint "reference_account_id"
      t.timestamps
    end

    add_index :canonical_email_blocks, :canonical_email_hash, unique: true
    add_index :canonical_email_blocks, :reference_account_id
  end
end
