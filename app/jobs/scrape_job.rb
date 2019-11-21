require_relative 'scrapers/scraper'

class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    args.nil? ? scrapers = Scraper.all : scrapers = args
    puts scrapers
    scrapers.each do |scraper|
      url = fetch_shoes_url(scraper)
      url.each do |shoe|
        data = fetch_shoe_data(shoe, scraper)
        Shoe.create(data)
      end
    end
  end
end
