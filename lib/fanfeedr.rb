#require "fanfeedr/version"
#require "fanfeedr/league"
#require "open-uri"
#require 'json'

module Fanfeedr

  class Error < StandardError
    class ApiKeyMissing < Error; end
    class LeagueIdMissing < Error; end
  end

#  class << self
#
#    attr_accessor :api_key, :api_endpoint
#
#    # Alias for Fanfeedr::Client.new
#    #
#    # @return [Fanfeedr::Client]
#    def new(options)
#      #raise Fanfeedr::Error::ApiKeyMissing unless api_key
#      #@api_key = api_key
#      #@api_endpoint = 'http://ffapi.fanfeedr.com/basic/api'
#      Fanfeedr::Client.new(options)
#    end
#
#    # Delegate to Fanfeedr::Client
#    def method_missing(method, *args, &block)
#      return super unless new.respond_to?(method)
#      new.send(method, *args, &block)
#    end
#
#    def respond_to?(method, include_private=false)
#      new.respond_to?(method, include_private) || super(method, include_private)
#    end
#  end
#
##  def self.initialize(api_key = nil)
#    raise Fanfeedr::Error::ApiKeyMissing unless api_key
#    @api_key = api_key
#    @api_endpoint = 'http://ffapi.fanfeedr.com/basic/api'
#    Fanfeedr::Client.new(api_key)
#  end

#  def leagues
#    json = GET("#{@api_endpoint}/leagues?api_key=#{@api_key}")
#    leagues = JSON.parse(json)
#    leagues.each do |league|
#      puts league["id"]
#      puts league["name"]
#      puts
#      leagues << Fanfeedr::League.new(league["name"], league["id"]) 
#    end
#    json
#  end
#
#  def league(acronym = nil)
#    raise Fanfeedr::LeagueIdMissing unless acronym
#    json = JSON.parse(leagues)
#    json.select {|hash| hash["name"] == acronym }.first
#  end

end
