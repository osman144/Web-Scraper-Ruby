require 'open-uri'
require 'nokogiri'

url = "https://minneapolis.craigslist.org/d/services/search/bbb"

document = open(url)
content = document.read

parsed_content = Nokogiri::HTML(content)

parsed_content.css('.content').css('.rows').css('.result-row').each do |


puts parsed_content.css('.content').css('.rows').css('.result-row').first