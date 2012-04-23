require 'fanfeedr/utils'

module Fanfeedr
  class Leagues

    include Fanfeedr::Utils

    attr_reader :api_key, :list

    def initialize(api_key)
      @api_key = api_key
      @list = seed
      @records = nil
    end

    def seed 
      @records ||= fetch url
      @records.inject([]) do |list, league|
        list << Fanfeedr::League.new(league["name"], league["id"], @api_key)
      end
    end

    def find(name)
      puts "find(#{name})"
      @list.select { |l| 
        puts "#{l.name})"
        l.name == name 
      }.first
    end

    private

    def url
      "#{Fanfeedr::API_ENDPOINT}/leagues?api_key=#{@api_key}"
    end

  end
end
