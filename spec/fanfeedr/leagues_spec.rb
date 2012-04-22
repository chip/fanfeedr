require 'helper'
require 'fanfeedr'
require 'fanfeedr/utils'
require 'fanfeedr/leagues'

describe Fanfeedr::Leagues do

  before do
    url = "#{Fanfeedr::API_ENDPOINT}/leagues?api_key=#{stub_api_key}"
    stub_json_request(url, 'leagues.json')
  end

  subject { Fanfeedr::Leagues.new(stub_api_key) }

  it "should return an Array" do
    subject.list.should be_an_instance_of Array
  end

  it "should return 45 leagues" do
    subject.list.size.should == 45
  end

  it "should return the Fanfeedr leagues" do
    subject.list.each do |league|
      league.should be_an_instance_of Fanfeedr::League
    end
  end
end
