require 'fanfeedr'

#
# client = Fanfeedr::Client.new('your_api_key')
# leagues = Fanfeedr::Leagues.new(client)
# leagues.list => [Fanfeedr::League, Fanfeedr::League,...]
# leagues.for("NFL") => Fanfeedr::League
# league = Fanfeedr::League.new(client, league_id)
# 
module Fanfeedr
  class League

    def initialize(client, id)
      url = client.fanfeedr_url("/leagues/#{id}")
      @attributes = client.fetch(url)
    end

    def id
      @attributes["id"]
    end

    def name
      @attributes["name"]
    end

    def gender
      @attributes["gender"]
    end

    def sport
      @attributes["sport"]
    end

    def levels
      @attributes["levels"]
    end

    #def conferences
    #  puts "conferences........"
    #  data = fetch(conferences_url)
    #  @conferences = data.inject([]) do |accum, conference|
    #    puts "id #{@id}"
    #    accum << Fanfeedr::Conference.new(conference["id"], @id, @api_key)
    #    puts "accum: #{accum.inspect}"
    #    accum
    #  end
    #  puts "conferences: #{@conferences.inspect}"
    #  @conferences
    #end
  end
end
