require 'open-uri'
require 'nokogiri'
require 'bootsnap'
require 'watir'
require 'webdrivers'

class ScrapeSaintSavoyJob < ScrapeJob
  queue_as :default

  def perform(*args)
    url_shoe_list = "https://www.saintsavoy.com/en/product-category/ladies-shoes/"
    b = Watir::Browser.new :chrome, headless: true
    b.goto(url_shoe_list)
    s = b.select_list name: 'ppp'
    s.select '-1'
    shoes = []
    b.divs(class: 'image-glow').each do |div|
      shoes.push(div.a.href)
    end
    @shoes = shoes.take(2).map do |shoe|
      uri = URI.parse(shoe)
      uri.scheme = "https"
      uri.host = "www.saintsavoy.com"
      uri.query = nil
      uri.fragment = nil
      uri.to_s
    end
  end
end
