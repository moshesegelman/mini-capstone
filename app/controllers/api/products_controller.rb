class Api::ProductsController < ApplicationController

  def display
    @products = Product.all
    render 'products.json.jb'
  end
end
