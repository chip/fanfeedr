require 'fanfeedr'

module Fanfeedr
  class Leagues

    def initialize(client)
      @client = client
      unless client.is_a?(Fanfeedr::Client)
        raise ArgumentError, "Fanfeedr::Client is required"
      end
      @data = client.fetch("/leagues") 
    end

    def list
      @data.each_with_object([]) do |league, list|
        list << Fanfeedr::League.new(@client, league['id'])
      end
    end

    def for_league(name)
      league = @data.select do |league| 
        league['name'] == name
      end.first

      if league.nil?
        raise Fanfeedr::LeagueNotFound
      else
        Fanfeedr::League.new(@client, league['id'])
      end
    end

  end
end
