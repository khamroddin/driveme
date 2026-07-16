class CreateVehicleBrands < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicle_brands do |t|
      t.string :name
      t.string :country
      t.boolean :status
      t.string :slug

      t.timestamps
    end
  end
end
