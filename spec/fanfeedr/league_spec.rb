require "fanfeedr"
require "helper"

describe Fanfeedr::League do

  xit "should raise an error if an id is not provided"
  xit "should raise an error if an id is not found"

  let(:nfl) { stub_nfl }

  subject { Fanfeedr::League.new(nfl) }

  before do
    stub_json_request(stub_league_url(nfl), 'leagues/nfl.json')
  end

  context "NFL attributes" do

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
