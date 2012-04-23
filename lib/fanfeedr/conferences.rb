require 'fanfeedr/utils'
require 'fanfeedr/leagues'

module Fanfeedr
  class Conferences

    attr_reader :api_key, :league, :list

    def initialize(league_name, api_key)
      @api_key = api_key 
      @leagues = Fanfeedr::Leagues.new(@api_key)
      puts "leagues.class: #{@leagues.class}"
      puts "leagues: #{@leagues.inspect}"
      @league = @leagues.find(league_name)
      puts "league: #{@league.inspect}"
      @list = @league.conferences
    end

  end
end
