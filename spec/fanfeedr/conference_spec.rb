require "fanfeedr/conference"

describe Fanfeedr::Conference do

  subject { Fanfeedr::Conference.new("AFC", stub_api_key) }

  context "attributes" do

    it "should return the level" do
      subject.level.should == 'professional'
    end

    it "should return the name" do
      subject.name.should == 'AFC'
    end

    it "should return the id" do
      subject.id.should == '919758e9-ef9e-5c1a-9b9b-42fccfb0d4e6'
    end

    it "should return the league" do
      subject.league.should == 'NFL'
    end
  end
  
end
