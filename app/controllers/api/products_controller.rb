class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name], 
      price: params[:price],
      image_url: params[:image_url]
    )
    @product.save
    render 'show.json.jb'
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    @recipe.name = params[:name] || @recipe.name

    @recipe.price = params[:price] || @recipe.price

    @recipe.image_url = params[:image_url] || @recipe.image_url

    @recipe.save

    render 'show.json.jb'
  end

end
