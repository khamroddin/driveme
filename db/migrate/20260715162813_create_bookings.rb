class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.references :pickup_location,
                   null: false,
                   foreign_key: { to_table: :locations }

      t.references :drop_location,
                   null: false,
                   foreign_key: { to_table: :locations }

      t.date :pickup_date
      t.time :pickup_time

      t.date :return_date
      t.time :return_time

      t.integer :days

      t.decimal :rate, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :security_deposit, precision: 10, scale: 2
      t.decimal :discount, precision: 10, scale: 2
      t.decimal :tax, precision: 10, scale: 2
      t.decimal :total_amount, precision: 10, scale: 2

      t.string :booking_number
      t.string :rate_type

      t.integer :status, default: 0
      t.integer :payment_status, default: 0

      t.text :remarks

      t.timestamps
    end
  end
end