# require 'open-uri'
# require 'bootsnap'
# require 'watir'
# require 'webdrivers'

# class ScrapeSaintSavoyJob < ScrapeJob
#   queue_as :default
#   def perform(*args)
#     arg = %w[--disable-infobars --headless window-size=1600,1200 --no-sandbox --disable-gpu]
#     options = {
#       binary: ENV['GOOGLE_CHROME_BIN'],
#       prefs: { password_manager_enable: false, credentials_enable_service: false },
#       args:  arg
#     }
#     Selenium::WebDriver::Chrome.path = ENV['GOOGLE_CHROME_SHIM'] if ENV['GOOGLE_CHROME_SHIM'].present?

#     url_shoe_list = "https://www.saintsavoy.com/en/product-category/ladies-shoes/"
#     b = Watir::Browser.new(:chrome, options: options, headless: true)
#     b.goto(url_shoe_list)
#     s = b.select_list name: 'ppp'
#     s.select '-1'
#     shoes = []
#     b.divs(class: 'image-glow').each do |div|
#       shoes.push(div.a.href)
#     end
#     # @shoes = shoes.take(2).map do |shoe|
#     @shoes = shoes.map do |shoe|
#       uri = URI.parse(shoe)
#       uri.scheme = "https"
#       uri.host = "www.saintsavoy.com"
#       uri.query = nil
#       uri.fragment = nil
#       uri.to_s
#     end
#     @shoes.each do |shoe|
#       data = fetch_shoe_data(shoe)
#       Shoe.create(data)
#     end
#   end

#   def fetch_shoe_data(url)
#     html_content = open(url).read
#     doc = Nokogiri::HTML(html_content)
#     brand = 'Saint Savoy'
#     model = doc.css(".product-info h1").text.strip
#     price = doc.css("p.price span").text.strip.to_i
#     image_url = doc.css('.product-images img')[0]['src']
#     description = doc.css('#additional .accordion-inner p').text

#     {
#       url: url,
#       brand: brand,
#       model: model,
#       price: price,
#       image_url: image_url,
#       description: description
#     }
#   end
# end
