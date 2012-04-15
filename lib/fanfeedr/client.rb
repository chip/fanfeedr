require "fanfeedr"
require "open-uri"
require 'json'

module Fanfeedr
  class Client
    attr_accessor :api_key, :api_endpoint

    def initialize(api_key)
      @api_key = api_key
      @api_endpoint = 'http://ffapi.fanfeedr.com/basic/api'
    end

  private

    def GET(url)
      puts url
      open(url).read
    end
  end
end
