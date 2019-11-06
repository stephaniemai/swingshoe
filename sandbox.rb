require 'open-uri'
require 'nokogiri'

def fetch_shoes_url
  html_content = open('https://swivells.com/en/c/ankle-boots-and-derbies').read
  doc = Nokogiri::HTML(html_content)
  # shoes = doc.search('.product-card .frame .cta .size a')
  shoes = doc.search('.product-card .info .name a')
  @shoes = shoes.take(5).map do |shoe|
    uri = URI.parse(shoe.attributes["href"].value)
    uri.scheme = "https"
    uri.host = "www.swivells.com"
    uri.query = nil
    uri.fragment = nil
    uri.to_s
  end
  @shoes = @shoes.uniq
end

def fetch_shoe_data(url)
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)
  brand = 'Swivells'
  model = doc.css(".infos h1").text
  price = doc.css(".infos .price strong").children.text[1, 7].to_i
  image_url = doc.css(".pure-g img")[0]['src']
  description = doc.css(".infos .description").text

  {
    url: url,
    brand: brand,
    model: model,
    price: price,
    image_url: image_url,
    description: description
  }
end

url = fetch_shoes_url
# p url
url.each do |shoe|
  p fetch_shoe_data(shoe)
end

# class draft from scraper
class Scraper
  def initialize(brand, url, description, doc, host, shoe, price, image_url, shoe_description)
    @brand = brand
    @url = url
    @description = description
    @doc = doc
    @host = host
    @shoe = shoe
    @price = price
    @image_url = image_url
    @shoe_description = shoe_description
  end
end
