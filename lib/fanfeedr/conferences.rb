require 'fanfeedr'

module Fanfeedr
  class Conferences

    attr_reader :data

    def initialize(league_id, client)
      @client = client
      unless @client.is_a?(Fanfeedr::Client)
        raise ArgumentError, "Fanfeedr::Client is required"
      end
      @data = @client.fetch("/leagues/#{league_id}/conferences") 
    end

  end
end
