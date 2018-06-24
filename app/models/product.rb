class Product < ApplicationRecord

  belongs_to :supplier
  

  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :price, :name, :description, presence: true
  validates :price, numericality: true
  validates :name, length: {minimum: 5}
  validates :price, length: {in: 2..6}


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
