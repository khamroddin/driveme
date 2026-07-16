class Amenity < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged
  validates :name, presence: true
  validates :description, presence: true
  def should_generate_new_friendly_id?
    slug.blank? || will_save_change_to_name?
  end
end