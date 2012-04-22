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
  end
end
