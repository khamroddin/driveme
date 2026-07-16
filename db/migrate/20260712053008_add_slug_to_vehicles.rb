class AddSlugToVehicles < ActiveRecord::Migration[7.2]
  def change
    add_column :vehicles, :slug, :string
    add_index :vehicles, :slug, unique: true
  end
end