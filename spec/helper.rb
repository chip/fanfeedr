require 'webmock/rspec'
require "yaml"

def stub_api_key
  file = File.dirname(__FILE__) + '/support/fanfeedr.yml'
  YAML::load( File.open(file) )["key"]
end

def stub_api_endpoint
  'http://ffapi.fanfeedr.com/basic/api'
end

def stub_leagues_url
  "#{stub_api_endpoint}/leagues?api_key=#{stub_api_key}"
end

def stub_league_url(league)
  "#{stub_api_endpoint}/league/#{league['id']}?api_key=#{stub_api_key}"
end

def stub_nfl
  leagues = JSON.parse(json_fixture('leagues.json'))
  leagues.select {|league| league["name"] == "NFL" }.first
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
