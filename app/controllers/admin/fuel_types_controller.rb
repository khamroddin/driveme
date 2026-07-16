class Admin::FuelTypesController < Admin::BaseController
  before_action :set_fuel_type, only: %i[edit update destroy]
  def index
    @fuel_types = FuelType.order(:name)
  end

  def new
    @fuel_type = FuelType.new
  end

  def create
    @fuel_type = FuelType.new(fuel_type_params)

    if @fuel_type.save
      redirect_to admin_fuel_types_path,
                  notice: "Fuel Type  created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @fuel_type = FuelType.friendly.find(params[:id])
  end

  def update
    @fuel_type = FuelType.friendly.find(params[:id])
    if @fuel_type.update(fuel_type_params)
      redirect_to admin_fuel_types_path,
                  notice: "Fuel Type updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fuel_type = FuelType.friendly.find(params[:id])
    @fuel_type.destroy

    redirect_to admin_fuel_types_path,
                notice: "Fuel Type deleted successfully."
  end

  private
   def set_fuel_type
    @fuel_type = FuelType.friendly.find(params[:id])
  end
  def fuel_type_params
    params.require(:fuel_type).permit(
      :name,
      :active
    )
  end
end
