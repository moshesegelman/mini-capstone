class Api::ProductsController < ApplicationController

  def display
    @products = Product.all
    render 'products.json.jb'
  end

  def one_product
    @product = Product.first
    render 'one_product.json.jb'
  end

  def any_product
    @id = params["id"]
    @product = Product.find_by(id: @id)
    render 'any_product.json.jb'
  end
end
