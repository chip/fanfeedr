require "fanfeedr"
require "fanfeedr/league"
require "helper"

describe Fanfeedr::League do

  let(:id) { "13962b74-cab5-5d0a-93c8-466b6a3fa342" } 

  before do
    url = "#{Fanfeedr::API_ENDPOINT}/leagues/#{id}?api_key=#{stub_api_key}"
    stub_json_request(url, 'leagues/nfl.json')
  end

  subject { Fanfeedr::League.new("NFL", id, stub_api_key) }

  context "attributes" do

    it "should return the gender" do
      subject.gender.should == 'M'
    end

    it "should return the levels" do
      subject.levels.should == ["professional"]
    end

    it "should return the sport" do
      subject.sport.should == 'Football'
    end

    it "should return the name" do
      subject.name.should == 'NFL'
    end

    it "should return the id" do
      subject.id.should == '13962b74-cab5-5d0a-93c8-466b6a3fa342'
    end

  end
  
end
