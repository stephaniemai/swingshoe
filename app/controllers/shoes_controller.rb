class ShoesController < ApplicationController
  def index
    if params[:search].present?
      # @shoes = Shoe.search_by_brand_and_model(params[:search].to_s)
      # @shoes = Shoe.find_by_sql("SELECT * from shoes WHERE
      #   upper(brand) like upper('%#{params[:search]}%')
      #   OR upper(model) like upper('%#{params[:search]}%')
      # ").order('price asc, brand asc, model asc')
      sql_query = "brand ILIKE :query OR model ILIKE :query"
      @pagy, @shoes = pagy(Shoe.where(sql_query, query: "%#{params[:search]}%")
        .order(price: :asc, brand: :asc, model: :asc))
    else
      @pagy, @shoes = pagy(Shoe.all.order(price: :asc, brand: :asc, model: :asc))
      # @shoes = Shoe.first(15).sort_by { |shoe| [shoe.price, shoe.brand, shoe.model] }
      # @shoes = Shoe.limit(25).order("RANDOM()").sort_by { |shoe| [shoe.price, shoe.brand, shoe.model] }
    end
  end

  def show
    @shoe = Shoe.find(params[:id])
  end
end
