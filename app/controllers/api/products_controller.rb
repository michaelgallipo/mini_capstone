class Api::ProductsController < ApplicationController

  def products_all
    @products = Product.all
    render "products_view.json.jbuilder"
  end
  
end
