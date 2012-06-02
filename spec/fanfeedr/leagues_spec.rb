require 'helper'
require 'fanfeedr'

describe Fanfeedr::Leagues do

  let(:client) { Fanfeedr::Client.new(stub_api_key) }

  before do
    stub_json_request(client.fanfeedr_url("/leagues"), 'leagues.json')
    stub_leagues
  end
      
  context "validation of client in first argument" do

    it "should not raise an error on initialization with a valid client" do
      lambda { Fanfeedr::Leagues.new(client) }.should_not raise_error
    end
    
    it "should raise an error on initialization with no client" do
      lambda { Fanfeedr::Leagues.new() }.should raise_error(ArgumentError)
    end
  end

  context "instance methods" do

    subject { Fanfeedr::Leagues.new(client) }

    context "#list" do

      it "should return an Array object" do
        subject.list.should be_a(Array)
      end

      it "should return an Array of Fanfeedr::League objects" do
        subject.list.each do |league|
          league.should be_a(Fanfeedr::League)
        end
      end

      it "should return 45 leagues" do
        subject.list.size.should == 45
      end
    end

    context "#for_league" do

      it "should return a Fanfeedr::League object" do
        subject.for_league("NFL").should be_a(Fanfeedr::League)
      end
    
      it "should raise an error if league name cannot be found" do
        expect {subject.for_league("wadiyamean")}.to raise_error(Fanfeedr::LeagueNotFound)
      end

    end
  end
end
