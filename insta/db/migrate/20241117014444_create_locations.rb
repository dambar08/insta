class CreateLocations < ActiveRecord::Migration[7.2]
  def change
    create_table :locations do |t|
      t.bigint(:locatorable_id)
      t.bigint(:locatorable_type)
      t.string(:name)
      t.decimal(:latitude, precision: 9, scale: 6)
      t.decimal(:longitude, precision: 9, scale: 6)
      t.string(:country)
      t.string(:state)
      t.string(:city)
      t.timestamps
    end

    add_index :locations, [:locatorable_id,:locatorable_type]
  end
end
