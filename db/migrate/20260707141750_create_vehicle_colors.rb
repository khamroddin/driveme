class CreateVehicleColors < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicle_colors do |t|
      t.string :name
      t.boolean :active
      t.string :slug

      t.timestamps
    end
  end
end
