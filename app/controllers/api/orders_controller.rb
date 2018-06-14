class Api::OrdersController < ApplicationController

  def show
    order_id = params[:id]
    @order = Order.find_by(id: order_id)
    render "show.json.jbuilder"
  end

  def create
    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      )

    order_id = @order.id
      
   subtotal = @order.product[:price] * @order[:quantity]
    @order.subtotal = subtotal
    @order.tax = subtotal * 0.09
    @order.total = subtotal * 1.09

    @order.save

    render "show.json.jbuilder"
  end

end
