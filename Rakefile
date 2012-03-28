require 'rubygems'
require 'rake'
require 'rake/clean'

DATA_DIR="data"

CLEAN.include ["#{DATA_DIR}/*.csv","#{DATA_DIR}/*.json"]

task :price_paid do
  sh %{ruby bin/price-paid.rb}
end

task :download => [:price_paid]