class Customers::VehiclesController < Customers::BaseController
  def index
    @vehicles = Vehicle.available_catalog
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end