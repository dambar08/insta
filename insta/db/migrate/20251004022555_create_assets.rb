class CreateAssets < ActiveRecord::Migration[7.2]
  def change
    create_table :assets do |t|
      t.belongs_to :viewable, polymorphic: true
      t.integer :position
      t.timestamps
    end
  end
end
