require 'helper'
require 'fanfeedr'

describe Fanfeedr::Leagues do

  let(:client) { Fanfeedr::Client.new(stub_api_key) }

  context "validation of client in first argument" do
    it "should not raise an error on initialization with a valid" do
      lambda {
        Fanfeedr::Leagues.new(client)
      }.should_not raise_error
    end
    
    it "should raise an error on initialization with no client" do
      lambda {
        Fanfeedr::Leagues.new()
      }.should raise_error(ArgumentError)
    end
  end

  context "instance methods" do

    subject { Fanfeedr::Leagues.new(client) }

    before do
      stub_json_request(client.fanfeedr_url("/leagues"), 'leagues.json')
    end
      
    describe '.client' do

      it "should be a Fanfeedr::Client" do
        subject.client.should be_a(Fanfeedr::Client)
      end
    end

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

      before do
        url = client.fanfeedr_url("/leagues/13962b74-cab5-5d0a-93c8-466b6a3fa342")
        stub_json_request(url, 'leagues/nfl.json')
      end

      it "should return a Fanfeedr::League object" do
        subject.for_league("NFL").should be_a(Fanfeedr::League)
      end
    
      it "should raise an error if league name cannot be found" do
        subject.for_league("wadiyamean").should raise_error(LeagueNotFoundError)
      end

    end
  end
end
