require 'rubygems'
require 'csv'
require 'hpricot'
require 'open-uri'

page = Hpricot( open("http://www1.landregistry.gov.uk/market-trend-data/price-paid-data/price-paid-data-files") )

dir = File.dirname(__FILE__) 

if !File.exists?( File.join(dir, "..", "data") )
  Dir.mkdir( File.join(dir, "..", "data") )
end

HEADERS = [
  "Unique ID","Price date", "Postcode","Property type old/new", "Duration", "PAON", 
  "SAON","Street","Locality","Town","District","County","Record Status"]

CSV.open( File.join(dir, "..", "data/bath-house-prices.csv"), "w") do |output|
  output << HEADERS
  page.search("#middle a").each do |link|
    if link["href"].match(/csv$/)
      $stderr.puts("Processing #{link["title"]}")
      data = open("http://www1.landregistry.gov.uk#{link["href"]}").read
      CSV.parse( data ) do |row|
        if row[3] != nil && row[3].match(/^BA(1|2) /)
          output << row
        end       
      end
    end
  end
end