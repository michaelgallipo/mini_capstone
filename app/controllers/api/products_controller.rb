class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def create
    @product = Product.create(
      name: params[:name],
      category: params[:category],
      price: params[:price],
      description: params[:description],
      color: params[:color]
      )
    render "show.json.jbuilder"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
      @product.name = params[:name] || @product.name
      @product.category = params[:category] || @product.category
      @product.price = params[:price] || @product.price
      @product.description = params[:description] || @product.description
      @product.color = params[:color] || @product.color

      @product.save 
    render "show.json.jbuilder"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: {message: "Product successfully deleted"}
  end


  # def choice
  #   option = params[:id]
  #   if option = "index"
  #     @products = Product.all
  #     render "index.json.jbuilder" 
  #   else
  #     product_id = params[:id]
  #     @product = Product.find_by(id: product_id)
  #     render "show.json.jbuilder"
  #   end
  # end


end
