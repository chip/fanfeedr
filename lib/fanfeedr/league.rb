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

    def initialize(id, client)
      unless client.is_a?(Fanfeedr::Client)
        raise ArgumentError, "Fanfeedr::Client is required"
      end
      if id.nil?
        raise Fanfeedr::LeagueIdMissing, "Oops, no league id was provided" 
      end
      @attributes = client.fetch("/leagues/#{id}")
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

  end
end
