class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def show
    @category_count = Category.count
    @product_count = Product.count
  end
end
