class Admin::SalesController < ApplicationController
  def index
    # render :index (implicit)
    @sales = Sale.all

  end
end
