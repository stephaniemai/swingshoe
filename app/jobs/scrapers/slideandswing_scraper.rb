require 'open-uri'
require 'nokogiri'

def fetch_shoes_url
  html_content = open('https://www.slideandswing.es/en/11-for-her').read
  doc = Nokogiri::HTML(html_content)
  shoes = doc.search('article a.text-muted')
  # @shoes = shoes.take(5).map do |shoe|
  @shoes = shoes.map do |shoe|
    uri = URI.parse(shoe.attributes["href"].value)
    uri.scheme = "https"
    uri.host = "www.slideandswing.es"
    uri.query = nil
    uri.fragment = nil
    uri.to_s
  end
end

def fetch_shoe_data(url)
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)
  brand = 'Slide and Swing'
  model = doc.css("#ss-detalle-producto [itemprop = 'name']").text
  price = doc.css("#ss-detalle-producto [itemprop = 'price']")[0]['content'].to_i
  image_url = doc.css('#ss-product_cover img')[0]['src']
  description = doc.css('#ss-detalle-producto .description p').text

  {
    url: url,
    brand: brand,
    model: model,
    price: price,
    image_url: image_url,
    description: description
  }
end
