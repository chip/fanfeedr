module Fanfeedr
  class Leagues

    def initialize(client=nil)
      unless client.is_a?(Fanfeedr::Client)
        raise ArgumentError, "Fanfeedr::Client is required"
      end
      @client = client
    end

    def client
      @client
    end

    def list
      url = client.fanfeedr_url("leagues")
      records = client.fetch url
      records.each_with_object([]) do |league, list|
        list << Fanfeedr::League.new(client, league['id'])
      end
    end
  end
end
