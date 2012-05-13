require 'fanfeedr/utils'

module Fanfeedr
  class Leagues

    include Fanfeedr::Utils

    def initialize(api_key)
      @api_key = api_key
      @list = seed
    end

    def find(name)
      @list.select { |league| league.name == name }.first
    end

    def api_key
      @api_key 
    end

    def list
      @list 
    end

    private

    def seed 
      records = fetch url
      records.inject([]) do |list, league|
        list << Fanfeedr::League.new(league["name"], league["id"], @api_key)
      end
    end

    def url
      "#{Fanfeedr::API_ENDPOINT}/leagues?api_key=#{@api_key}"
    end

  end
end
