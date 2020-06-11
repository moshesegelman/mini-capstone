class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]
   

  def index
    # if current_user
    @products = Product.all
    # if params[:search]
    #   @products = @products.where("name iLIKE ?","%#{params[:search]}%")
    # end
    # if params[:discount] 
    #   @products = @products.where("price < ?", 15)
    # end
    # if params[:sort] == "price"
    #   if params[:sort_order] == "asc"
    #     @products = @products.order(:price)
    #   elsif params[:sort_order] == "desc"
    #     @products = @products.order(price: :desc)
    #   end
    # else
    #   @products = @products.order(:id)
    # end
    render 'index.json.jb'
    # else
    #   render json:{message: "user not logged in"}
    # end
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
      description: params[:description],
      supplier_id: params[:supplier_id]
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
