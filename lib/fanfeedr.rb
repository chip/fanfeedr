require "fanfeedr/version"
require "open-uri"
require 'json'

class Fanfeedr

  class ApiKeyMissing < StandardError; end
  class LeagueIdMissing < StandardError; end

  attr_accessor :api_key, :api_endpoint

  def initialize(api_key = nil)
    raise Fanfeedr::ApiKeyMissing unless api_key
    @api_key = api_key
    @api_endpoint = 'http://ffapi.fanfeedr.com/basic/api'
  end

  def leagues
    GET("#{@api_endpoint}/leagues?api_key=#{@api_key}")
  end

  def league(acronym = nil)
    raise Fanfeedr::LeagueIdMissing unless acronym
    json = JSON.parse(leagues)
    json.select {|hash| hash["name"] == acronym }.first
  end

  private

  def GET(url)
    puts url
    open(url).read
  end

end
