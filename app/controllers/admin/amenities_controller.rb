class Admin::AmenitiesController < Admin::MasterDataController
  before_action :set_amenity, only: %i[edit update destroy]

  def index
    @amenities = Amenity.order(:name)
  end

  def new
    @amenity = Amenity.new
  end

  def create
    @amenity = Amenity.new(amenity_params)

    if @amenity.save
      success_redirect admin_amenities_path,
                       "Amenity created successfully."
    else
      validation_failed :new
    end
  end

  def edit
  end

  def update
    if @amenity.update(amenity_params)
      success_redirect admin_amenities_path,
                       "Amenity updated successfully."
    else
      validation_failed :edit
    end
  end

  def destroy
    @amenity.destroy

    success_redirect admin_amenities_path,
                     "Amenity deleted successfully."
  end

  private

  def set_amenity
    @amenity = Amenity.friendly.find(params[:id])
  end

  def amenity_params
    params.require(:amenity)
          .permit(:name, :description, :active)
  end
end