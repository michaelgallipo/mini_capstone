class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def price_per_unit
    @order.product[:price]
  end


end
