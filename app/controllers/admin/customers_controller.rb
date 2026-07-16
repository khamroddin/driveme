class Admin::CustomersController < Admin::BaseController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

     if @customer.save
     redirect_to admin_customers_path,
              notice: "Customer created successfully."
     else
      render :new, status: :unprocessable_entity
     end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      redirect_to admin_customers_path,
                  notice: "Customer updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
  @customer.destroy

  redirect_to admin_customers_path,
              notice: "Customer deleted successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :mobile, :alternate_mobile, :email, :driving_license_no, :license_expiry, :id_proof_type, :id_proof_number, :address, :city, :state, :country, :pincode, :notes, :status, :slug)
    end
end
