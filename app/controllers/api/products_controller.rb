class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:sort_by_price] == true
      @products = @products.order[:price]
    else
      @products = @products.order(:id)
    end

    render "index.json.jbuilder"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def create
    if current_user && current_user.admin
      @product = Product.create(
        name: params[:name],
        price: params[:price],
        description: params[:description],
        color: params[:color],
        availability: params[:availability],
        supplier_id: params[:supplier_id]
        )

      if @product.save
        render "show.json.jbuilder"
      else
        render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    if current_user && current_user.admin
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
        @product.name = params[:name] || @product.name
        @product.price = params[:price] || @product.price
        @product.description = params[:description] || @product.description
        @product.color = params[:color] || @product.color
        @product.availability = params[:availability] || @product.availability
        @product_supplier_id = params[:supplier_id] || @product.supplier_id

      if @product.save 
        render "show.json.jbuilder"
      else
        render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end

  end

  def destroy
    if current_user && current_user.admin
      product_id = params[:id]
      @product = Product.find_by(id: product_id)
      @product.destroy
      render json: {message: "Product successfully deleted"}
    else
      render json: {}, status: :unauthorized
    end

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
