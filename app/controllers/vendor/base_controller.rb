class Vendor::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :authorize_vendor!

  private

  def authorize_vendor!
    redirect_to root_path, alert: "Access denied." unless current_user.super_admin? || current_user.admin?
  end
end
