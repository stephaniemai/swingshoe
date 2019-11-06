class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all.sort_by(&:price)
  end

  def show
    @shoe = Shoe.find(params[:id])
  end
end
