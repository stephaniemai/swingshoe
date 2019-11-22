class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all.sort_by { |shoe| [shoe.price, shoe.brand, shoe.model] }
  end

  def show
    @shoe = Shoe.find(params[:id])
  end
end
