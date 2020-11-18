class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def index
    # render :index (implicit)
    @sales = Sale.all

  end
end
