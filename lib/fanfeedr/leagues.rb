require 'fanfeedr'

module Fanfeedr
  class Leagues

    def initialize(client=nil)
      unless client.is_a?(Fanfeedr::Client)
        raise ArgumentError, "Fanfeedr::Client is required"
      end
      @client = client
      records = client.fetch("/leagues") 
      @data = JSON.parse(records)
    end

    def list
      @data.each_with_object([]) do |league, list|
        list << Fanfeedr::League.new(@client, league['id'])
      end
    end

    def for_league(name)
      league = @data.select {|league| league.name == name }
      # raise error if league not found
    end

  end
end
