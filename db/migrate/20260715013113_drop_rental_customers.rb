class DropRentalCustomers < ActiveRecord::Migration[7.2]
  def change
    drop_table :rental_customers
  end
end
