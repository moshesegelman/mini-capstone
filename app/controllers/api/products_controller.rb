class Api::ProductsController < ApplicationController

  def display
    @products = Product.all
    render 'products.json.jb'
  end

  def one_product
    @product = Product.first
    render 'one_product.json.jb'
  end
end
