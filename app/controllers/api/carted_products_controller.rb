class Api::CartedProductsController < ApplicationController

  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jb'
  end

  def create
    @carted_product = CartedProduct.new(
      status: "carted",
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: nil
    )
    if @carted_product.save
      render 'show.json.jb'
    else
      render json: {error: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    @carted_product.update(status: "removed")
    render json: {status: "carted product removed"}
  end

end
  

