# app/controllers/customers/dashboard_controller.rb

class Customers::DashboardController < Customers::BaseController
   def index
    @customer = current_customer

    @total_bookings = @customer.bookings.count

    @active_bookings = @customer.bookings.where(status: "confirmed").count

    @completed_bookings = @customer.bookings.where(status: "completed").count

    @wishlist_count = Wishlist.where(customer: @customer).count rescue 0

    @recent_bookings = @customer.bookings
                                .includes(:vehicle)
                                .order(created_at: :desc)
                                .limit(5)
  end
end