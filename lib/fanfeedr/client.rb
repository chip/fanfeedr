require 'fanfeedr'

module Fanfeedr

  class Client

    attr_accessor :api_key 
    attr_reader :leagues

    def initialize(api_key=nil)
      raise ArgumentError if api_key.nil?
      @api_key = api_key
      @leagues = []
    end

    def api_endpoint
      'http://ffapi.fanfeedr.com/basic/api'
    end

    def get(url)
      open(url).read
    end

    def fetch(url)
      json = get fanfeedr_url(url)
      JSON.parse(json)
    end

    def fanfeedr_url(url)
      "#{api_endpoint}#{url}?api_key=#{api_key}"
    end

  end
end

