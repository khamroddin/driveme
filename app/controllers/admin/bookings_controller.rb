class Admin::BookingsController < Admin::BaseController
  before_action :set_booking, only: [
    :show,
    :approve,
    :reject,
    :start_rental,
    :complete_rental
  ]

  def index
    @bookings = Booking
                  .includes(:customer, :vehicle)
                  .order(created_at: :desc)
  end

  def show
  end

  def approve
    @booking.update!(status: :confirmed)

    redirect_to admin_booking_path(@booking),
                notice: "Booking approved successfully."
  end

  def reject
    @booking.update!(status: :cancelled)

    redirect_to admin_booking_path(@booking),
                notice: "Booking rejected successfully."
  end

  def start_rental
    @booking.update!(status: :ongoing)

    redirect_to admin_booking_path(@booking),
                notice: "Rental started successfully."
  end

  def complete_rental
    @booking.update!(status: :completed)

    redirect_to admin_booking_path(@booking),
                notice: "Rental completed successfully."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end