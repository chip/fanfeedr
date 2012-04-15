require "fanfeedr/client"
require "yaml"

describe Fanfeedr::Client do

  let(:api_key) do
    file = File.dirname(__FILE__) + '/../support/fanfeedr.yml'
    YAML::load( File.open(file) )["key"]
  end
  subject { Fanfeedr::Client.new(api_key) }

  it "should have an API endpoint" do
    subject.api_endpoint.should == 'http://ffapi.fanfeedr.com/basic/api'
  end

  it "should have require an api key" do
    subject.api_key.should == api_key
  end

  it "should return a Fanfeedr::Client" do
    subject.should be_an_instance_of Fanfeedr::Client
  end

  context "leagues" do

    let(:json) { File.open( File.dirname(__FILE__) + '/fixtures/leagues.json' ).read }

    xit "should fetch the leagues" do
      subject.stub("GET") { json }
      subject.leagues.should == json
    end

    xit ".leagues should return an array of leagues" do
      subject.stub("GET") { json }
      subject.leagues.first.should_be_an_instance_of Fanfeedr::League
    end

    it "should raise exception if league id is not provided" do
      subject.stub("GET") { json }
      lambda { subject.league() }.should raise_exception Fanfeedr::Error::LeagueIdMissing
    end

    it "should return league id" do
      subject.stub("GET") { json }
      nba = subject.league("NBA")
      nba["id"].should == "f65226d8-fbf7-5033-a7a0-50de55b57968"
    end
  end

  context "teams" do

    let(:json) { File.open( File.dirname(__FILE__) + '/fixtures/nfl.json' ).read }

    xit "should fetch the teams for the NFL" do
      subject.stub("GET") { json }
      subject.teams_for("NFL").should == json
    end

    xit "should raise exception if league is not provided" do
      subject.stub("GET") { json }
      lambda { subject.teams_for() }.should raise_exception Fanfeedr::Error::LeagueIdMissing
    end

    xit "should fetch a team" do
      subject.stub("GET") { json }
      nfl = subject.teams_for("NFL")
      record["id"].should == "f65226d8-fbf7-5033-a7a0-50de55b57968"
    end
  end
end
