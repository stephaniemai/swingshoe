# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

data = {
  brand: "Slide and Swing",
  shoe_list_url: 'https://www.slideandswing.es/en/11-for-her',
  scraper_description: "Slide and swing - For Her",
  links: 'article a.text-muted',
  host: 'www.slideandswing.es',
  model: 'doc.css("#ss-detalle-producto [itemprop = \'name\']").text',
  price: 'doc.css("#ss-detalle-producto [itemprop = \'price\']")[0][\'content\'].to_i',
  image_url: 'doc.css("#ss-product_cover img")[0][\'src\']',
  description: 'doc.css("#ss-detalle-producto .description p").text'
}

Scraper.create(data)


data = {
  brand: "Swivells",
  shoe_list_url: 'https://swivells.com/en/c/ankle-boots-and-derbies',
  scraper_description: "Swivells",
  links: '.product-card .info .name a',
  host: 'www.swivells.com',
  model: 'doc.css(".infos h1").text',
  price: 'doc.css(".infos .price strong").children.text[1, 7].to_i',
  image_url: 'doc.css(".pure-g img")[0][\'src\']',
  description: 'doc.css(".infos .description").text'
}

Scraper.create(data)
