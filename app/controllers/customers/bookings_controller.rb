class Customers::BookingsController < Customers::BaseController

  def index
    @bookings = current_customer.bookings
                                .includes(:vehicle)
                                .order(created_at: :desc)
  end

  def new
    load_form_data

    @booking = current_customer.bookings.new(
      vehicle: @vehicle,
      rate: @vehicle.daily_rate,
      security_deposit: @vehicle.security_deposit,
      pickup_time: Time.current.change(sec: 0),
      return_time: Time.current.change(sec: 0)
    )
  end

  def show
    @booking = current_customer.bookings.find(params[:id])
  end

  def create
    @booking = current_customer.bookings.new(booking_params)

    load_form_data

    if @booking.save
      redirect_to customers_booking_path(@booking),
                  notice: "Booking created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def load_form_data
    vehicle_id = params[:vehicle_id] || params.dig(:booking, :vehicle_id)

    @vehicle = Vehicle.find(vehicle_id)
    @locations = Location.order(:name)
  end

  def booking_params
    params.require(:booking).permit(
      :vehicle_id,
      :pickup_location_id,
      :drop_location_id,
      :pickup_date,
      :pickup_time,
      :return_date,
      :return_time,
      :days,
      :rate,
      :subtotal,
      :security_deposit,
      :discount,
      :tax,
      :total_amount
    )
  end
end