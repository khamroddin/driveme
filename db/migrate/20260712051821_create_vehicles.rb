class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_category, null: false, foreign_key: true
      t.references :vehicle_brand, null: false, foreign_key: true
      t.references :fuel_type, null: false, foreign_key: true
      t.references :transmission_type, null: false, foreign_key: true
      t.references :vehicle_color, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :registration_number
      t.string :vin
      t.string :model
      t.string :variant
      t.integer :manufacture_year
      t.integer :seating_capacity
      t.integer :doors
      t.integer :mileage
      t.string :engine_capacity
      t.decimal :daily_rate, precision: 10, scale: 2
      t.decimal :weekly_rate, precision: 10, scale: 2
      t.decimal :monthly_rate, precision: 10, scale: 2
      t.decimal :security_deposit, precision: 10, scale: 2
      t.text :description
      t.integer :status

      t.timestamps
    end
    add_index :vehicles, :registration_number, unique: true
  end
end
