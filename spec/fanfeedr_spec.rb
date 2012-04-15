require "fanfeedr"
require "yaml"

describe Fanfeedr do

  context "without an api key" do

    it "should raise an exception" do
      lambda { Fanfeedr.new() }.should raise_exception(Fanfeedr::ApiKeyMissing)
    end
  end

  let(:api_key) do
    file = File.dirname(__FILE__) + '/support/fanfeedr.yml'
    YAML::load( File.open(file) )["key"]
  end
  subject { Fanfeedr.new(api_key) }

  it "should have an API endpoint" do
    subject.api_endpoint.should == 'http://ffapi.fanfeedr.com/basic/api'
  end

  it "should have require an api key" do
    subject.api_key.should == api_key
  end

  xit "should respond to GET requests" do
    subject.GET().should be
  end

  context "leagues" do

    let(:json) { File.open( File.dirname(__FILE__) + '/fixtures/leagues.json' ).read }

    it "should fetch the leagues" do
      subject.stub("GET") { json }
      subject.leagues.should == json
    end

    it "should raise exception if league id is not provided" do
      subject.stub("GET") { json }
      lambda { subject.league() }.should raise_exception Fanfeedr::LeagueIdMissing
    end

    it "should return league id" do
      subject.stub("GET") { json }
      record = subject.league("NBA")
      record["id"].should == "f65226d8-fbf7-5033-a7a0-50de55b57968"
    end
  end

end
