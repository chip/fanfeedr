require 'webmock/rspec'
require "yaml"

def stub_api_key
  file = File.dirname(__FILE__) + '/support/fanfeedr.yml'
  YAML::load( File.open(file) )["key"]
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
