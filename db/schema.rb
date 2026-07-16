# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_07_15_162813) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "vehicle_id", null: false
    t.bigint "pickup_location_id", null: false
    t.bigint "drop_location_id", null: false
    t.date "pickup_date"
    t.time "pickup_time"
    t.date "return_date"
    t.time "return_time"
    t.integer "days"
    t.decimal "rate", precision: 10, scale: 2
    t.decimal "subtotal", precision: 10, scale: 2
    t.decimal "security_deposit", precision: 10, scale: 2
    t.decimal "discount", precision: 10, scale: 2
    t.decimal "tax", precision: 10, scale: 2
    t.decimal "total_amount", precision: 10, scale: 2
    t.string "booking_number"
    t.string "rate_type"
    t.integer "status", default: 0
    t.integer "payment_status", default: 0
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["drop_location_id"], name: "index_bookings_on_drop_location_id"
    t.index ["pickup_location_id"], name: "index_bookings_on_pickup_location_id"
    t.index ["vehicle_id"], name: "index_bookings_on_vehicle_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "mobile"
    t.string "alternate_mobile"
    t.string "driving_license_no"
    t.date "license_expiry"
    t.string "id_proof_type"
    t.string "id_proof_number"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.text "notes"
    t.boolean "status", default: true, null: false
    t.index ["driving_license_no"], name: "index_customers_on_driving_license_no", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["mobile"], name: "index_customers_on_mobile", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "fuel_types", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "phone"
    t.string "email"
    t.boolean "active"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transmission_types", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_brands", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.boolean "status"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_categories", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_vehicle_categories_on_slug", unique: true
  end

  create_table "vehicle_colors", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "vehicle_category_id", null: false
    t.bigint "vehicle_brand_id", null: false
    t.bigint "fuel_type_id", null: false
    t.bigint "transmission_type_id", null: false
    t.bigint "vehicle_color_id", null: false
    t.bigint "location_id", null: false
    t.string "registration_number"
    t.string "vin"
    t.string "model"
    t.string "variant"
    t.integer "manufacture_year"
    t.integer "seating_capacity"
    t.integer "doors"
    t.integer "mileage"
    t.string "engine_capacity"
    t.decimal "daily_rate", precision: 10, scale: 2
    t.decimal "weekly_rate", precision: 10, scale: 2
    t.decimal "monthly_rate", precision: 10, scale: 2
    t.decimal "security_deposit", precision: 10, scale: 2
    t.text "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["fuel_type_id"], name: "index_vehicles_on_fuel_type_id"
    t.index ["location_id"], name: "index_vehicles_on_location_id"
    t.index ["slug"], name: "index_vehicles_on_slug", unique: true
    t.index ["transmission_type_id"], name: "index_vehicles_on_transmission_type_id"
    t.index ["vehicle_brand_id"], name: "index_vehicles_on_vehicle_brand_id"
    t.index ["vehicle_category_id"], name: "index_vehicles_on_vehicle_category_id"
    t.index ["vehicle_color_id"], name: "index_vehicles_on_vehicle_color_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "locations", column: "drop_location_id"
  add_foreign_key "bookings", "locations", column: "pickup_location_id"
  add_foreign_key "bookings", "vehicles"
  add_foreign_key "vehicles", "fuel_types"
  add_foreign_key "vehicles", "locations"
  add_foreign_key "vehicles", "transmission_types"
  add_foreign_key "vehicles", "vehicle_brands"
  add_foreign_key "vehicles", "vehicle_categories"
  add_foreign_key "vehicles", "vehicle_colors"
end
