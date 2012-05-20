require 'fanfeedr'

#
# client = Fanfeedr::Client.new('your_api_key')
# leagues = Fanfeedr::Leagues.new(client)
# leagues.list => [Fanfeedr::League, Fanfeedr::League,...]
# leagues.for("NFL) => Fanfeedr::League
# league = Fanfeedr::League.new(client, league_id)
# 
module Fanfeedr
  class League

    def initialize(client, id)
      url = client.fanfeedr_url("league/#{id}")
      @league = client.fetch(url)
    end

    def id
      @league["id"]
    end

    def name
      @league["name"]
    end

    def gender
      @league["gender"]
    end

    def sport
      @league["sport"]
    end

    def levels
      @league["levels"]
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
