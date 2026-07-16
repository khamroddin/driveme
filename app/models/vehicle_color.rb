class VehicleColor < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged
  has_many :vehicles, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end