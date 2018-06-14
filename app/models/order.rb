class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

def calc_subtotal
  product.price * quantity
end

def calc_tax
  subtotal * 0.09
end

def calc_total
  subtotal + tax
end

def customer
  user.name
end

def customer_email
  user.email
end

def product_name
  product.name
end

def friendly_order_date
    created_at.strftime("%b %d, %Y")
end


end
