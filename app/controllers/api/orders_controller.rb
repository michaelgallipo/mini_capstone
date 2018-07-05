class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render "show.json.jbuilder"
  end

  def create

    @carted_products = current_user.carted_products.where('status = ?', 'carted')

    subtotal = 0
    
    @carted_products.each do |carted_product| 
      subtotal = subtotal + carted_product.product.price * carted_product.quantity
    end

    tax = subtotal * 0.09 
    total = subtotal + tax

    @order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )

    @carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = @order.id
      carted_product.save
    end
      
   # subtotal = @order.product[:price] * @order[:quantity]
   #  @order.subtotal = subtotal
   #  @order.tax = subtotal * 0.09
   #  @order.total = subtotal * 1.09


  # @order.subtotal = @order.calc_subtotal
  # @order.tax = @order.calc_tax
  # @order.total = @order.calc_total

  # @order.save

    render "show.json.jbuilder"
  end

end
