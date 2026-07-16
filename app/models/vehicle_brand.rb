class VehicleBrand < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  has_many :vehicles, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(status: true) }

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end