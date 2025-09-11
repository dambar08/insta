class CreateAccountPins < ActiveRecord::Migration[7.2]
  def change
    create_table :account_pins do |t|
      t.timestamps
    end
  end
end
