class Api::CartedProductsController < ApplicationController

  before_action :authenticate_user

  def index

    if current_user 
      @carted_products = current_user.carted_products.where('status = ?', 'carted')

      render 'index.json.jbuilder'
      
    else
      render json: ["fail"]
    end
  end

  def show
    @carted_product = CartedProduct.find(params[:id])
    render "show.json.jbuilder"
  end


  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      )
    render "show.json.jbuilder"
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")
    render json: {message: "Carted Product removed"}
  end


end
