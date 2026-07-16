class Vehicle < ApplicationRecord
  belongs_to :vehicle_category
  belongs_to :vehicle_brand
  belongs_to :fuel_type
  belongs_to :transmission_type
  belongs_to :vehicle_color
  belongs_to :location

  has_one_attached :thumbnail
  has_many_attached :gallery

  has_many :bookings, dependent: :restrict_with_error

  enum :status, {
    available: 0,
    booked: 1,
    maintenance: 2,
    inactive: 3
  }

  # ==========================
  # Scopes
  # ==========================
  scope :available_catalog, lambda {
    available
      .includes(
        :vehicle_brand,
        :vehicle_category,
        :fuel_type,
        :transmission_type,
        :vehicle_color,
        :location,
        thumbnail_attachment: :blob
      )
      .order(:daily_rate)
  }

  # ==========================
  # Validations
  # ==========================
  validates :registration_number,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: {
              with: /\A[A-Z]{2}\d{2}[A-Z]{1,2}\d{4}\z/i,
              message: "must be like KA01AB1234"
            }

  validates :vehicle_brand,
            :vehicle_category,
            :fuel_type,
            :transmission_type,
            :vehicle_color,
            :location,
            presence: true

  validates :model,
            :variant,
            :engine_capacity,
            :description,
            presence: true

  validates :manufacture_year,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1990,
              less_than_or_equal_to: Date.current.year + 1
            }

  validates :seating_capacity,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0,
              less_than_or_equal_to: 20
            }

  validates :doors,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 1,
              less_than_or_equal_to: 8
            }

  validates :mileage,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            }

  validates :daily_rate,
            presence: true,
            numericality: {
              greater_than: 0
            }

  validates :weekly_rate,
            :monthly_rate,
            :security_deposit,
            numericality: {
              greater_than_or_equal_to: 0
            },
            allow_nil: true

  validates :status, presence: true

  validate :acceptable_thumbnail
  validate :acceptable_gallery

  private

  def acceptable_thumbnail
    return unless thumbnail.attached?

    unless thumbnail.content_type.in?(%w[image/png image/jpeg image/jpg image/webp])
      errors.add(:thumbnail, "must be PNG, JPG or WEBP")
    end

    if thumbnail.blob.byte_size > 5.megabytes
      errors.add(:thumbnail, "must be smaller than 5 MB")
    end
  end

  def acceptable_gallery
    return unless gallery.attached?

    gallery.each do |image|
      unless image.content_type.in?(%w[image/png image/jpeg image/jpg image/webp])
        errors.add(:gallery, "contains an invalid image")
      end

      if image.blob.byte_size > 5.megabytes
        errors.add(:gallery, "images must be smaller than 5 MB")
      end
    end
  end
end