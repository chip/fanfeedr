require 'fanfeedr'

module Fanfeedr
  class Conference

    def initialize(resource_id, id, client)
      unless client.is_a?(Fanfeedr::Client)
        raise ArgumentError, "Fanfeedr::Client is required"
      end
      if resource_id.nil?
        raise Fanfeedr::ResourceIdMissing, "Oops, no resource id was provided" 
      end
      if id.nil?
        raise Fanfeedr::ConferenceIdMissing, "Oops, no conference id was provided" 
      end
      @resource_id, @client = resource_id, client
      @attributes = client.fetch("/leagues/#{resource_id}/conferences/#{id}")
    end

    def id 
      @attributes["id"]
    end

    def name 
      @attributes["name"]
    end

    def level 
      @attributes["level"]
    end

    def league
      Fanfeedr::League.new(@resource_id, @client)
    end

  end
end
