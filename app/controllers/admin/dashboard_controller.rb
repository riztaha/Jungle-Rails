class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASS"]

  def show
    @categories = Category.count
    @inventory = Product.count
  end
end
