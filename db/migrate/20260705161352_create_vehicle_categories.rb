class CreateVehicleCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicle_categories do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.text :description
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :vehicle_categories, :name, unique: true
    add_index :vehicle_categories, :code, unique: true
  end
end