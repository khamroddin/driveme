class Customers::ProfilesController < Customers::BaseController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer

    if @customer.update(profile_params)
      redirect_to customers_profile_path,
                  notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :mobile,
      :alternate_mobile,
      :email,
      :driving_license_no,
      :license_expiry,
      :id_proof_type,
      :id_proof_number,
      :address,
      :city,
      :state,
      :country,
      :pincode,
      :notes
    )
  end
end