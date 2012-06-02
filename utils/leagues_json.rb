#!/usr/bin/env ruby -I lib
require 'fanfeedr'
require 'yaml'

file = File.dirname(__FILE__) + '/spec/support/fanfeedr.yml'
api_key = YAML::load( File.open(file) )["key"]
client = Fanfeedr::Client.new(api_key)

filename = File.dirname(__FILE__) + "/spec/fixtures/leagues.json"
data = File.open(filename).read
leagues = JSON.parse(data)

leagues.each do |league|
  name = league['name'].to_s.downcase.gsub(/ /, '_')
  id = league['id']
  data = client.get client.fanfeedr_url("/leagues/#{id}")
  puts data
  File.open("spec/fixtures/leagues/#{name}.json", 'w') do |f|
    f.write data
  end
end
