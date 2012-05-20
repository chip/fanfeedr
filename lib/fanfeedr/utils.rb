require 'open-uri'
require 'json'

module Fanfeedr
  module Utils
    def get(url)
      open(url).read
    end

    def fetch(url)
      json = get url 
      JSON.parse(json)
    end

    def url(url)
      "#{api_endpoint}/#{url}?api_key=#{stub_api_key}"
    end

  end
end
