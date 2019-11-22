require_relative 'scrapers/scraper'

class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(*input)
    scrapers = []
    if input.blank?
      scrapers = Scraper.all
    else
      scrapers << find_scrapers(input)
    end
    scrapers.each { |scraper| create_shoe(scraper) }
  end

  def find_scrapers(input)
    scrapers = []
    input.each do |item|
      if item.is_a?(String) || item.is_a?(Integer)
        scrapers << Scraper.find(item.to_i)
      else
        p "Please provide the id(s) of the scraper(s) you want to use (int)"
      end
    end
    return scrapers
  end

  def create_shoe(scraper)
    scraper.each do |item|
      url = fetch_shoes_url(item)
      url.each do |shoe|
        data = fetch_shoe_data(shoe, item)
        Shoe.create(data)
      end
    end
  end
end
