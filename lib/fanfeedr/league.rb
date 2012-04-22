require 'fanfeedr/utils'

module Fanfeedr
  class League

    include Fanfeedr::Utils

    attr_reader :api_key, :name, :id

    def initialize(name, id, api_key)
      @name = name
      @id = id
      @api_key = api_key
      @gender = nil
      @sport = nil
      @levels = nil
      @record = nil
    end

    def gender
      @record ||= fetch(url)
      @gender = @record["gender"]
    end

    def sport 
      @record ||= fetch(url)
      @sport = @record["sport"]
    end

    def levels
      @record ||= fetch(url)
      @levels = @record["levels"]
    end

    private

    def url
      "#{Fanfeedr::API_ENDPOINT}/leagues/#{@id}?api_key=#{@api_key}"
    end

  end
end
