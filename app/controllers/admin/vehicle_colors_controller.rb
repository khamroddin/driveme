class Admin::VehicleColorsController < Admin::BaseController
  before_action :set_vehicle_color, only: %i[edit update destroy]

  def index
    @vehicle_colors = VehicleColor.order(:name)
  end

  def new
    @vehicle_color = VehicleColor.new
  end

  def create
    @vehicle_color = VehicleColor.new(vehicle_color_params)

    if @vehicle_color.save
      redirect_to admin_vehicle_colors_path,
                  notice: "Vehicle Color created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @vehicle_color.update(vehicle_color_params)
      redirect_to admin_vehicle_colors_path,
                  notice: "Vehicle Color updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle_color.destroy
    redirect_to admin_vehicle_colors_path,
                notice: "Vehicle Color deleted successfully."
  end

  private

  def set_vehicle_color
    @vehicle_color = VehicleColor.friendly.find(params[:id])
  end

  def vehicle_color_params
    params.require(:vehicle_color).permit(:name, :active)
  end
end