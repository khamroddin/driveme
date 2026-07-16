class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  enum :role, {
    super_admin: 0,
    admin: 1,
    vendor: 2,
    vendor_staff: 3,
    customer: 4
  }
end