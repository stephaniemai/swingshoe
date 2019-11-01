require 'open-uri'
require 'nokogiri'

html_content = open('https://www.slideandswing.es/en/for-her/188-1539-ava-new-lila.html').read
doc = Nokogiri::HTML(html_content)
shoe = {}
shoe[:description_en] = doc.css('#ss-detalle-producto .description p').text

html_content = open('https://www.slideandswing.es/es/para-ella/188-1539-ava-new-lila.html').read
doc = Nokogiri::HTML(html_content)
shoe[:description_es] = doc.css('#ss-detalle-producto .description p').text

p shoe
# doc.search('#precio').each do |element|
#   puts "#{element.text.strip}"
# end
