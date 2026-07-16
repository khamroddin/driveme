class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle

  belongs_to :pickup_location,
             class_name: "Location"

  belongs_to :drop_location,
             class_name: "Location"

  enum :status, {
    pending: 0,
    confirmed: 1,
    ongoing: 2,
    completed: 3,
    cancelled: 4
  }

  # ----------------------------------------------------
  # Validations
  # ----------------------------------------------------

  validates :pickup_location, presence: true
  validates :drop_location, presence: true

  validates :pickup_date, presence: true
  validates :pickup_time, presence: true

  validates :return_date, presence: true
  validates :return_time, presence: true

  validate :return_after_pickup
  validate :vehicle_must_be_available
  validate :vehicle_availability

  # ----------------------------------------------------
  # Callbacks
  # ----------------------------------------------------

  before_validation :calculate_days
  before_validation :calculate_totals

  before_create :generate_booking_number

  private

  # ----------------------------------------------------
  # Calculate Rental Days
  # ----------------------------------------------------

  def calculate_days
    return if pickup_date.blank? || return_date.blank?

    self.days = (return_date - pickup_date).to_i
    self.days = 1 if days <= 0
  end

  # ----------------------------------------------------
  # Calculate Booking Amount
  # ----------------------------------------------------

  def calculate_totals
    return unless vehicle.present?
    return if days.blank?

    self.rate ||= vehicle.daily_rate
    self.security_deposit ||= vehicle.security_deposit

    self.discount ||= 0
    self.tax ||= 0

    self.subtotal = rate * days

    self.total_amount =
      subtotal +
      security_deposit +
      tax -
      discount
  end

  # ----------------------------------------------------
  # Booking Number
  # ----------------------------------------------------

  def generate_booking_number
    return if booking_number.present?

    last = Booking.order(:id).last
    next_number = last ? last.id + 1 : 1

    self.booking_number = format("BK%06d", next_number)
  end

  # ----------------------------------------------------
  # Return must be after Pickup
  # ----------------------------------------------------

  def return_after_pickup
    return if pickup_date.blank? ||
              pickup_time.blank? ||
              return_date.blank? ||
              return_time.blank?

    pickup_at = DateTime.new(
      pickup_date.year,
      pickup_date.month,
      pickup_date.day,
      pickup_time.hour,
      pickup_time.min
    )

    return_at = DateTime.new(
      return_date.year,
      return_date.month,
      return_date.day,
      return_time.hour,
      return_time.min
    )

    if return_at <= pickup_at
      errors.add(
        :return_date,
        "must be after pickup date and time"
      )
    end
  end

  # ----------------------------------------------------
  # Vehicle Active?
  # ----------------------------------------------------

  def vehicle_must_be_available
    return unless vehicle.present?

    unless vehicle.available?
      errors.add(
        :vehicle,
        "is currently unavailable for booking"
      )
    end
  end

  # ----------------------------------------------------
  # Prevent Double Booking
  # ----------------------------------------------------

  def vehicle_availability
    return if vehicle.blank?
    return if pickup_date.blank? ||
              pickup_time.blank? ||
              return_date.blank? ||
              return_time.blank?

    requested_pickup = DateTime.new(
      pickup_date.year,
      pickup_date.month,
      pickup_date.day,
      pickup_time.hour,
      pickup_time.min
    )

    requested_return = DateTime.new(
      return_date.year,
      return_date.month,
      return_date.day,
      return_time.hour,
      return_time.min
    )

    Booking.where(vehicle_id: vehicle_id)
           .where.not(id: id)
           .where.not(status: [:cancelled, :completed])
           .find_each do |booking|

      existing_pickup = DateTime.new(
        booking.pickup_date.year,
        booking.pickup_date.month,
        booking.pickup_date.day,
        booking.pickup_time.hour,
        booking.pickup_time.min
      )

      existing_return = DateTime.new(
        booking.return_date.year,
        booking.return_date.month,
        booking.return_date.day,
        booking.return_time.hour,
        booking.return_time.min
      )

      if requested_pickup < existing_return &&
         requested_return > existing_pickup

        errors.add(
          :base,
          "This vehicle is already booked from #{existing_pickup.strftime('%d %b %Y %I:%M %p')} to #{existing_return.strftime('%d %b %Y %I:%M %p')}."
        )

        break
      end
    end
  end
end