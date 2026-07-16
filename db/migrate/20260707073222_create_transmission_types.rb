class CreateTransmissionTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :transmission_types do |t|
      t.string :name
      t.boolean :active
      t.string :slug

      t.timestamps
    end
  end
end
