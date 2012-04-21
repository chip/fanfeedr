require 'open-uri'
require 'fanfeedr/client'

module Fanfeedr
  class League

    attr_reader :name, :id, :api_key

    def initialize(name, id, api_key)
      @name = name
      @id = id
      @api_key = api_key
    end

    def gender
      record["gender"]
    end

    def sport
      record["sport"]
    end

    def levels
      record["levels"]
    end

    private

    def url
      "#{Fanfeedr::API_ENDPOINT}/leagues/#{@id}?api_key=#{@api_key}"
    end

    def get(url)
      open(url).read
    end

    def record
      json = get url 
      JSON.parse(json)
    end

  end
end
