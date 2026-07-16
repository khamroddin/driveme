class CreateLocations < ActiveRecord::Migration[7.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :code
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :email
      t.boolean :active
      t.string :slug

      t.timestamps
    end
  end
end
