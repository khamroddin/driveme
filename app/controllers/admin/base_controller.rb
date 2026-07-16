class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  layout "admin"

  private

  def authorize_admin!
    return if current_user&.super_admin? || current_user&.admin?

    redirect_to root_path, alert: "Access denied."
  end
end