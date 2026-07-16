class Admin::DashboardController < Admin::BaseController
  def index
    @total_users = User.count
    @total_vehicles = Vehicle.count
    @total_customers = Customer.count

    # @total_vendors = defined?(Vendor) ? Vendor.count : 0
    # @total_bookings = defined?(Booking) ? Booking.count : 0
  end
end