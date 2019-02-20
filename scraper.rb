require 'open-uri'
require 'nokogiri'

url = "https://minneapolis.craigslist.org/d/services/search/bbb"

document = open(url)
content = document.read

parsed_content = Nokogiri::HTML(content)

parsed_content.css('.content').css('.rows').css('.result-row').each do |row|
    title = row.css('.result-title').inner_text
    posted_at = row.css('.result-info').css('.result-date').first.attributes['datetime'].value
    neighbor_elem = row.css('.result-info').css('.result-meta').css('.result-hood')
    # link = 

    if neighbor_elem.any? 
        neighborhood = neighbor_elem.inner_text
    else 
        neighborhood = ''
    end

    puts title 
    puts "Posted at #{posted_at}"
    puts "Neighborhood: #{neighborhood}"
    puts '-------------------------------------------------------------'
end 


# puts parsed_content.css('.content').css('.rows').css('.result-row').css('.result-info').css('.result-meta').css('.result-hood')