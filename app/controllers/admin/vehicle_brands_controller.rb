class Admin::VehicleBrandsController < Admin::BaseController
  before_action :set_vehicle_brand, only: %i[edit update destroy]
  def index
    @vehicle_brands = VehicleBrand.order(:name)
  end

  def new
    @vehicle_brand = VehicleBrand.new
  end

  def create
    @vehicle_brand = VehicleBrand.new(vehicle_brand_params)

    if @vehicle_brand.save
      redirect_to admin_vehicle_brands_path,
                  notice: "Vehicle Brand created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vehicle_brand = VehicleBrand.friendly.find(params[:id])
  end

  def update
    @vehicle_brand = VehicleBrand.friendly.find(params[:id])
    if @vehicle_brand.update(vehicle_brand_params)
      redirect_to admin_vehicle_brands_path,
                  notice: "Vehicle Brand updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle_brand = VehicleBrand.friendly.find(params[:id])
    @vehicle_brand.destroy

    redirect_to admin_vehicle_brandss_path,
                notice: "Vehicle Brand deleted successfully."
  end

  private
   def set_vehicle_brand
    @vehicle_brand = VehicleBrand.friendly.find(params[:id])
  end
  def vehicle_brand_params
    params.require(:vehicle_brand).permit(
      :name,
      :country,
      :status
    )
  end
end
