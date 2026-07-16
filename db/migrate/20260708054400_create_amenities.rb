class CreateAmenities < ActiveRecord::Migration[7.2]
  def change
    create_table :amenities do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.string :slug

      t.timestamps
    end
  end
end
