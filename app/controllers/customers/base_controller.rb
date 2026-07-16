# app/controllers/customers/base_controller.rb

class Customers::BaseController < ApplicationController
  layout "customer"

  before_action :authenticate_customer!
end