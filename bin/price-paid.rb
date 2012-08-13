require 'rubygems'
require 'csv'
require 'hpricot'
require 'open-uri'

page = Hpricot( open("http://www.landregistry.gov.uk/public/information/public-data/price-paid-data/price-paid-data-files") )

dir = File.dirname(__FILE__) 

if !File.exists?( File.join(dir, "..", "data") )
  Dir.mkdir( File.join(dir, "..", "data") )
end

HEADERS = [
  "Unique ID","Price","date", "Postcode","Property type", "old/new", "Duration", "PAON", 
  "SAON","Street","Locality","Town","District","County","Record Status"]

CSV.open( File.join(dir, "..", "data/bath-house-prices.csv"), "w") do |output|
  output << HEADERS
  page.search("table tr")[1..-1].reverse_each do |row| 
    $stderr.puts("Processing #{row.at("td").inner_text}")
    #Extract download link for CSV without column headers
    url = row.search("td")[2].at("a")["href"]
    data = open(url).read
    CSV.parse( data ) do |row|
         if row[3] != nil && row[3].match(/^BA(1|2) /)
           output << row
         end       
    end
  end

end