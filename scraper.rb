require 'open-uri'
require 'nokogiri'

url = "https://minneapolis.craigslist.org/d/services/search/bbb"

document = open(url)
content = document.read

parsed_content = Nokogiri::HTML(content)

parsed_content.css('.content').css('.rows').css('.result-row').each do |row|
    title = row.css('.result-title').inner_text
    puts title 
    puts '-------------------------------------'
end 


# puts parsed_content.css('.content').css('.rows').css('.result-row').css('.result-title').inner_text