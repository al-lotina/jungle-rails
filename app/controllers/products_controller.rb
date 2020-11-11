class ProductsController < ApplicationController

  def index
    @msg = 'look here'
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
