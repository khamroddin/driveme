class Admin::LocationsController < Admin::BaseController
  before_action :set_location, only: %i[edit update destroy]

  def index
    @locations = Location.order(:name)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to admin_locations_path,
                  notice: "Location created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to admin_locations_path,
                  notice: "Location updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy
    redirect_to admin_locations_path,
                notice: "Location deleted successfully."
  end

  private

  def set_location
    @location = Location.friendly.find(params[:id])
  end

  def location_params
    params.require(:location).permit(
      :name,
      :code,
      :address,
      :city,
      :state,
      :country,
      :phone,
      :email,
      :active
    )
  end
end