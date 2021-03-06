require 'open-uri'
require 'nokogiri'

def fetch_shoes_url(scraper)
  html_content = open(scraper.shoe_list_url).read
  doc = Nokogiri::HTML(html_content)
  shoes = doc.search(scraper.links)
  # @shoes = shoes.take(2).map do |shoe|
  @shoes = shoes.map do |shoe|
    uri = URI.parse(shoe.attributes["href"].value)
    uri.scheme = "https"
    uri.host = scraper.host
    uri.query = nil
    uri.fragment = nil
    uri.to_s
  end
  @shoes = @shoes.uniq
  @shoes
end

def fetch_shoe_data(url, scraper)
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)
  brand = scraper.brand
  model = eval(scraper.model)
  price = eval(scraper.price)
  image_url = eval(scraper.image_url)
  description = eval(scraper.description)

  {
    url: url,
    brand: brand,
    model: model,
    price: price,
    image_url: image_url,
    description: description
  }
end
