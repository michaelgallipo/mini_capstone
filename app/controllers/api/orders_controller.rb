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
      
   # subtotal = @order.product[:price] * @order[:quantity]
   #  @order.subtotal = subtotal
   #  @order.tax = subtotal * 0.09
   #  @order.total = subtotal * 1.09


  @order.subtotal = @order.calc_subtotal
  @order.tax = @order.calc_tax
  @order.total = @order.calc_total

  @order.save

    render "show.json.jbuilder"
  end

end
