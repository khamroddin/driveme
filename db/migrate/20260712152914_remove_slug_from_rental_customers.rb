class RemoveSlugFromRentalCustomers < ActiveRecord::Migration[7.2]
  def change
    remove_column :rental_customers, :slug, :string
  end
end