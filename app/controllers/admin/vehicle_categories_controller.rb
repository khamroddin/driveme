class Admin::VehicleCategoriesController < Admin::BaseController

  def index
    @vehicle_categories = VehicleCategory.order(:name)
  end

  def new
    @vehicle_category = VehicleCategory.new
  end

  def create
    @vehicle_category = VehicleCategory.new(vehicle_category_params)

    if @vehicle_category.save
      redirect_to admin_vehicle_categories_path,
                  notice: "Vehicle category created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @vehicle_category = VehicleCategory.find(params[:id])
  end

  def update
    @vehicle_category = VehicleCategory.find(params[:id])

    if @vehicle_category.update(vehicle_category_params)
      redirect_to admin_vehicle_categories_path,
                  notice: "Vehicle category updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle_category = VehicleCategory.find(params[:id])
    @vehicle_category.destroy

    redirect_to admin_vehicle_categories_path,
                notice: "Vehicle category deleted successfully."
  end

  private

  def vehicle_category_params
    params.require(:vehicle_category).permit(
      :name,
      :code,
      :description,
      :active
    )
  end
end