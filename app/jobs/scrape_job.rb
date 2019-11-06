# require_relative 'scrapers/slideandswing_scraper'
require_relative 'scrapers/swivells_scraper'

class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    url = fetch_shoes_url
    url.each do |shoe|
      p shoe
      data = fetch_shoe_data(shoe)
      p data
      Shoe.create(data)
      # Shoe.create({
      #   url: "https://www.swivells.com/en/p/mustard-yellow-nubuck-boots-mama-sandy",
      #   brand: "Swivells",
      #   model: "Mama Sandy",
      #   price: 179,
      #   image_url: "https://s3.eu-west-2.amazonaws.com/swivells/products/12/images/large/Msy.jpg?1542887000",
      #   description: "Our Mama Sandy flat ankle boot in mustard yellow is your “go-to” shoe! You can wear it with nearly anything in your wardrobe, whether it be summer or winter. Its smooth and textured yellow nubuck leather blends harmoniously for perfection from every angle, bringing an understated charm to your look year round."
      # })
    end
  end
end
