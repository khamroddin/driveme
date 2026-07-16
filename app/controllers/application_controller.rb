class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when User
      case resource.role
      when "super_admin", "admin"
        admin_dashboard_path
      when "vendor", "vendor_staff"
        vendor_dashboard_path
      else
        root_path
      end

    when Customer
      customers_dashboard_path

    else
      super
    end
  end

  def configure_permitted_parameters
    # Customer Registration
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[
        first_name
        last_name
        mobile
      ]
    )

    # Customer Profile Update
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[
        first_name
        last_name
        mobile
        alternate_mobile
        driving_license_no
        license_expiry
        id_proof_type
        id_proof_number
        address
        city
        state
        country
        pincode
        notes
      ]
    )
  end
end