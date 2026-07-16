class Admin::TransmissionTypesController < Admin::BaseController
  before_action :set_transmission_type, only: %i[edit update destroy]
  def index
    @transmission_types = TransmissionType.order(:name)
  end

  def new
    @transmission_type = TransmissionType.new
  end

  def create
    @transmission_type = TransmissionType.new(transmission_type_params)

    if @transmission_type.save
      redirect_to admin_transmission_types_path,
                  notice: "Transmission Type  created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @transmission_type = TransmissionType.friendly.find(params[:id])
  end

  def update
    @transmission_type = TransmissionType.friendly.find(params[:id])
    if @transmission_type.update(transmission_type_params)
      redirect_to admin_transmission_types_path,
                  notice: "Transmission Type updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transmission_type = TransmissionType.friendly.find(params[:id])
    @transmission_type.destroy

    redirect_to admin_transmission_types_path,
                notice: "Transmission Type deleted successfully."
  end

  private
   def set_transmission_type
    @transmission_type = TransmissionType.friendly.find(params[:id])
  end
  def transmission_type_params
    params.require(:transmission_type).permit(
      :name,
      :active
    )
  end
end
