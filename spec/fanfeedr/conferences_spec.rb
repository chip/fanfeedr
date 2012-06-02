require "helper"
require 'fanfeedr'

describe Fanfeedr::Conferences do

  let(:client) { Fanfeedr::Client.new(stub_api_key) }

  before do
    url = client.fanfeedr_url("/leagues/NFL/conferences")
    stub_json_request(url, 'leagues/NFL/conferences.json')
  end

  subject { Fanfeedr::Conferences.new('NFL', client) }

  it "should return a Fanfeedr::Conferences object" do
    subject.should be_an_instance_of Fanfeedr::Conferences
  end

  context ".data" do

    it "should return an Array" do
      subject.data.should be_an_instance_of Array
    end

    it "should return 2 conferences" do
      subject.data.size.should == 2
    end

  end
  
end
