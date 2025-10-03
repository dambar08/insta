class CreateAccountSettings < ActiveRecord::Migration[7.2]
  def self.up
    create_table :account_settings do |t|
      t.belongs_to :account, null: false
      t.string  :var,        null: false
      t.text    :value,      null: true
      t.timestamps
    end

    add_index :account_settings, [:var], unique: true
  end

  def self.down
    drop_table :account_settings
  end
end
