require "helper"
require 'fanfeedr'
require "fanfeedr/conferences"

describe Fanfeedr::Conferences do

  before do
    url = "#{Fanfeedr::API_ENDPOINT}/leagues?api_key=#{stub_api_key}"
    stub_json_request(url, 'leagues/nfl/conferences.json')
  end

  subject { Fanfeedr::Conferences.new('NFL', stub_api_key) }

  it "should return an Array" do
    subject.should be_an_instance_of Array
  end

  it "should return 2 conferences" do
    subject.conferences.size.should == 2
  end

  it "should return the NFL conferences" do
    subject.each do |conference|
      conference.should be_an_instance_of Fanfeedr::Conference
    end
  end
  
end
