class Product < ApplicationRecord

  def is_discounted?
    price <100
  end

  def sales_tax
    price * 0.09
  end

  def total_price
    price + sales_tax
  end

  def sales_message
    if price < 100
      "Discount Item!"
    else
      "Everyday Value!"
    end
  end

end
