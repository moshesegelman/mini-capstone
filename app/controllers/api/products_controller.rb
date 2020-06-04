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
      stock: params[:stock],
      image_url: params[:image_url],
      description: params[:description]
    )
    if @product.save
    render 'show.json.jb'
    else
      render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @prodcut.stock = parmas[:stock] || @product.stock
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    
    if @product.save
      render 'show.json.jb'
    else
        render json: {error: @product.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "product has been terminated"}
  end

end
