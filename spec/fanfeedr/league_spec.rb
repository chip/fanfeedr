require "fanfeedr"
require "helper"

describe Fanfeedr::League do

  context "with an invalid client" do

    it "should raise an Fanfeedr::InvalidClient exception" do
      lambda {
        Fanfeedr::League.new('13962b74-cab5-5d0a-93c8-466b6a3fa342', "foo")
      }.should raise_error(ArgumentError)
    end
  end

  context "with a valid client" do

    before do
      @client = Fanfeedr::Client.new(stub_api_key)
    end

    context "Invalid League id" do

      before do
        url = @client.fanfeedr_url("/leagues/")
        stub_json_request(url, 'leagues/nfl.json')
      end

      it "should raise an error if an id is not provided" do
        expect {Fanfeedr::League.new(nil, @client)}.to 
          raise_error(Fanfeedr::LeagueIdMissing)
      end
    end

    context "Valid League id" do

      before do 
        url = @client.fanfeedr_url("/leagues/13962b74-cab5-5d0a-93c8-466b6a3fa342")
        stub_json_request(url, 'leagues/nfl.json')
        @nfl = Fanfeedr::League.new('13962b74-cab5-5d0a-93c8-466b6a3fa342', @client)
      end

      context "NFL attributes" do

        it "should return the gender" do
          @nfl.gender.should == 'M'
        end

        it "should return the levels" do
          @nfl.levels.should == ["professional"]
        end

        it "should return the sport" do
          @nfl.sport.should == 'Football'
        end

        it "should return the name" do
          @nfl.name.should == 'NFL'
        end

        it "should return the id" do
          @nfl.id.should == '13962b74-cab5-5d0a-93c8-466b6a3fa342'
        end
      end
    end
  end
end
