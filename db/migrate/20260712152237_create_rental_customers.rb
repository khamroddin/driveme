class CreateRentalCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :rental_customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :alternate_mobile
      t.string :email
      t.string :driving_license_no
      t.date :license_expiry
      t.string :id_proof_type
      t.string :id_proof_number
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.text :notes
      t.boolean :status
      t.string :slug

      t.timestamps
    end
  end
end
