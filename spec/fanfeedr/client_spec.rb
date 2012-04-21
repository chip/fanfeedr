require "fanfeedr/client"
require "yaml"

describe Fanfeedr::Client do

  let(:api_key) do
    file = File.dirname(__FILE__) + '/../support/fanfeedr.yml'
    YAML::load( File.open(file) )["key"]
  end
  subject { Fanfeedr::Client.new(api_key) }

  it "should have require an api key" do
    subject.api_key.should == api_key
  end

  it "should have a leagues url" do
    subject.leagues_url.should == "#{Fanfeedr::API_ENDPOINT}/leagues/api_key=#{subject.api_key}"
  end

  it "should return a Fanfeedr::Client" do
    subject.should be_an_instance_of Fanfeedr::Client
  end

  context "methods" do

    let(:leagues_json) do
      File.open( File.dirname(__FILE__) + '/../fixtures/leagues.json' ).read
    end

    before do
      subject.stub("get") { leagues_json }
    end

    describe ".leagues" do
      it "should return an Array" do
        subject.leagues.should be_an_instance_of Array
      end

      it "should return 45 leagues" do
        subject.leagues.size.should == 45
      end
    
      it "should return the Fanfeedr leagues" do
        subject.leagues.each do |league|
          league.should be_an_instance_of Fanfeedr::League
        end
      end
    end

    describe ".for_league" do

      it "should find the league" do
        subject.for_league("NFL").should be_an_instance_of Fanfeedr::League
      end

      it "should return the league id" do
        subject.for_league("NFL").id.should == '13962b74-cab5-5d0a-93c8-466b6a3fa342'
      end
    end

  end
end
