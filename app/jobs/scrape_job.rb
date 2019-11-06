require_relative 'scrapers/slideandswing_scraper'
# require_relative 'scrapers/swivells_scraper'

class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    url = fetch_shoes_url
    url.each do |shoe|
      p shoe
      data = fetch_shoe_data(shoe)
      p data
      Shoe.create(data)
    end
  end
end
