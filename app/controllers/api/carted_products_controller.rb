class Api::CartedProductsController < ApplicationController

  def index

    #if current_user
      @carted_products = CartedProduct.where('status = ?', 'carted')

      render 'index.json.jbuilder'
      
    # else
    #   render json: ["fail"]
    # end
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
end
