# require_relative 'scrapers/slideandswing_scraper'
# require_relative 'scrapers/swivells_scraper'
require_relative 'scrapers/scraper'

class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(scraper_id)
    scraper = Scraper.find(scraper_id)
    url = fetch_shoes_url(scraper)
    url.each do |shoe|
      data = fetch_shoe_data(shoe, scraper)
      Shoe.create(data)
    end
  end
end
