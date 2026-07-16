class Customer < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true, uniqueness: true

  scope :active, -> { where(status: true) }

  has_many :bookings, dependent: :restrict_with_error

  def full_name
    "#{first_name} #{last_name}"
  end
end