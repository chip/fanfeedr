require 'helper'
require 'fanfeedr'

describe Fanfeedr::Client do

  context "validation of api key in first argument" do
    it "should not raise an error on initialization with a valid api key" do
      lambda {
        Fanfeedr::Client.new(stub_api_key)
      }.should_not raise_error
    end
    
    it "should raise an error on initialization with no api key" do
      lambda {
        Fanfeedr::Client.new()
      }.should raise_error(ArgumentError)
    end
  end

  context "instance methods" do

    subject { Fanfeedr::Client.new(stub_api_key) }

    before do
      url = "#{subject.api_endpoint}/leagues?api_key=#{subject.api_key}"
      stub_json_request(url, 'leagues.json')
    end

    context "#api_endpoint" do
      
      it "should have an API endpoint" do
        subject.api_endpoint.should == 'http://ffapi.fanfeedr.com/basic/api'
      end
    end

  end

end
