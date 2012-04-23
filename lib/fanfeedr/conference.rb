require 'fanfeedr/utils'

module Fanfeedr
  class Conference

    attr_reader :name, :id, :api_key, :parent_resource, :resource_id, :resource

    def initialize(name, id, resource_id, api_key)
      @name = name
      @id = id
      @resource_id = resource_id
      @api_key = api_key
      @parent_resource = 'leagues'
      @resource = 'conferences'
    end

    def level 
      record["level"]
    end

    private

    def url
      "#{Fanfeedr::API_ENDPOINT}/#{@parent_resource}/#{@resource_id}/#{@id}?api_key=#{@api_key}"
    end

  end
end
