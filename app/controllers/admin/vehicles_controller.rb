class Admin::VehiclesController < Admin::BaseController
  before_action :set_vehicle, only: %i[show edit update destroy]

  def index
  @vehicles = Vehicle.includes(
    :vehicle_category,
    :vehicle_brand,
    :fuel_type,
    :transmission_type,
    :vehicle_color,
    :location
  )

  @vehicles = @vehicles.where(
    "registration_number ILIKE ? OR model ILIKE ?",
    "%#{params[:search]}%",
    "%#{params[:search]}%"
  ) if params[:search].present?

  @vehicles = @vehicles.where(vehicle_brand_id: params[:brand]) if params[:brand].present?

  @vehicles = @vehicles.where(vehicle_category_id: params[:category]) if params[:category].present?

  @vehicles = @vehicles.where(location_id: params[:location]) if params[:location].present?

  @vehicles = @vehicles.where(status: params[:status]) if params[:status].present?

  @vehicles = @vehicles.order(created_at: :desc)
end

  def show
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to admin_vehicles_path,
                  notice: "Vehicle created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to admin_vehicles_path,
                  notice: "Vehicle updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle.destroy

    redirect_to admin_vehicles_path,
                notice: "Vehicle deleted successfully."
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(
      :vehicle_category_id,
      :vehicle_brand_id,
      :fuel_type_id,
      :transmission_type_id,
      :vehicle_color_id,
      :location_id,
      :registration_number,
      :vin,
      :model,
      :variant,
      :manufacture_year,
      :seating_capacity,
      :doors,
      :mileage,
      :engine_capacity,
      :daily_rate,
      :weekly_rate,
      :monthly_rate,
      :security_deposit,
      :description,
      :status,
      :thumbnail,
      gallery: []
    )
  end
end