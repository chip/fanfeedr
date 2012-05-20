require "fanfeedr"

module Fanfeedr

  class Client

    include Fanfeedr::Utils

    attr_accessor :api_key

    def initialize(api_key=nil)
      raise ArgumentError if api_key.nil?
      
      @api_key = api_key
    end

    def api_endpoint
      'http://ffapi.fanfeedr.com/basic/api'
    end

    def leagues
      records = fetch url
      records.inject([]) do |list, league|
        list << Fanfeedr::League.new(league)
      end
    end

    private

    def url
      "#{api_endpoint}/leagues?api_key=#{@api_key}"
    end
    
  end
end
