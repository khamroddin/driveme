class AddProfileFieldsToCustomers < ActiveRecord::Migration[7.2]
  def change
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :mobile, :string
    add_column :customers, :alternate_mobile, :string

    add_column :customers, :driving_license_no, :string
    add_column :customers, :license_expiry, :date

    add_column :customers, :id_proof_type, :string
    add_column :customers, :id_proof_number, :string

    add_column :customers, :address, :text
    add_column :customers, :city, :string
    add_column :customers, :state, :string
    add_column :customers, :country, :string
    add_column :customers, :pincode, :string

    add_column :customers, :notes, :text
    add_column :customers, :status, :boolean, default: true, null: false

    add_index :customers, :mobile, unique: true
    add_index :customers, :driving_license_no, unique: true
  end
end