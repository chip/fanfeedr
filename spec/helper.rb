require "webmock/rspec"
require "yaml"
require "fanfeedr/utils"

def stub_api_key
  file = File.dirname(__FILE__) + '/support/fanfeedr.yml'
  YAML::load( File.open(file) )["key"]
end

def stub_api_endpoint
  'http://ffapi.fanfeedr.com/basic/api'
end

def json_fixture(file)
  filename = File.dirname(__FILE__) + "/fixtures/#{file}"
  File.open(filename).read
end

def stub_json_request(url, file)
  json = json_fixture(file)
  stub_request(:get, url).
           with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
           to_return(:status => 200, :body => json, :headers => {})
end

def stub_leagues
  leagues = JSON.parse(json_fixture('leagues.json'))
  leagues.each do |league|
    url = client.fanfeedr_url("/leagues/#{league['id']}")
    name = league['name'].to_s.downcase.gsub(' ', '_')
    stub_json_request(url, "leagues/#{name}.json")
  end
end

def stub_nfl
  leagues = JSON.parse(json_fixture('leagues.json'))
  leagues.select {|league| league["name"] == "NFL" }.first
end
  
