require 'fanfeedr'

module Fanfeedr
  class League < Client

    include Fanfeedr::Utils

    attr_reader :name, :id

    def initialize(league)
      @id = league["id"]
      @name = league["name"]
    end

    def gender
      fetch(url)["gender"]
    end

    def sport 
      fetch(url)["sport"]
    end

    def levels
      fetch(url)["levels"]
    end

    def conferences
      puts "conferences........"
      data = fetch(conferences_url)
      @conferences = data.inject([]) do |accum, conference|
        puts "id #{@id}"
        accum << Fanfeedr::Conference.new(conference["id"], @id, @api_key)
        puts "accum: #{accum.inspect}"
        accum
      end
      puts "conferences: #{@conferences.inspect}"
      @conferences
    end

      
 private

    def url
      "#{api_endpoint}/league/#{@id}?api_key=#{@api_key}"
    end

    def conferences_url
      "#{api_endpoint}/leagues/#{@id}/conferences?api_key=#{@api_key}"
    end
  end
end
