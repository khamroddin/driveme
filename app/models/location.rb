class Location < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged
  has_many :vehicles, dependent: :restrict_with_error

  validates :name, :code, presence: true
  validates :name, :code, uniqueness: true

  scope :active, -> { where(active: true) }

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end