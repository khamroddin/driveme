class AddSlugToVehicleCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :vehicle_categories, :slug, :string
    add_index :vehicle_categories, :slug, unique: true
  end
end