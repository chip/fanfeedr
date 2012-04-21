require 'open-uri'
require 'json'
require 'fanfeedr'

module Fanfeedr
  class Client
    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def leagues_url
      "#{Fanfeedr::API_ENDPOINT}/leagues/api_key=#{@api_key}"
    end

    def leagues
      data ||= seed
    end

    def seed
      data = []
      json = get leagues_url
      records = JSON.parse(json)
      records.each do |league|
        data << Fanfeedr::League.new(league["name"], league["id"], @api_key)
      end
      data
    end

    def for_league(name)
      match = leagues.select do |league|
        league.name == name
      end.first
      match
    end
    alias_method :league, :for_league
      
    def get(url)
      open(url).read
    end
  end
end
