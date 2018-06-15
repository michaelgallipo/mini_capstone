class Api::ImagesController < ApplicationController

  def show
    image_id = params[:id]
    @image = Image.find_by(id: image_id)
    render "show.json.jbuilder"
  end

  def create
    @image = Image.create(
      url: params[:url],
      product_id: params[:product_id]
      )
    render "show.json.jbuilder"
  end

end
