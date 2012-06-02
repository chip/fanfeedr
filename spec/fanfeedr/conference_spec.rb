require "fanfeedr"
require "helper"

describe Fanfeedr::Conference do

  let(:afc_id) {'919758e9-ef9e-5c1a-9b9b-42fccfb0d4e6'}
  let(:nfl_id) {'13962b74-cab5-5d0a-93c8-466b6a3fa342'}

  context "with an invalid client" do

    it "should raise an Fanfeedr::InvalidClient exception" do
      lambda {Fanfeedr::Conference.new("foo", afc_id)}.should 
        raise_error(ArgumentError)
    end
  end

  context "with a valid client" do

    before do
      @client = Fanfeedr::Client.new(stub_api_key)
    end

    context "Invalid Conference id" do

      it "should raise an error if an id is not provided" do
        expect {Fanfeedr::Conference.new(nil, nil, @client)}.to 
          raise_error(Fanfeedr::ConferenceIdMissing)
      end
    end

    context "Valid Conference id" do

      before do
        nfl_url = @client.fanfeedr_url("/leagues/#{nfl_id}")
        stub_json_request(nfl_url, 'leagues/nfl.json')

        afc_url = @client.fanfeedr_url("/leagues/#{nfl_id}/conferences/#{afc_id}")
        stub_json_request(afc_url, 'leagues/nfl/conferences/afc.json')

        @afc = Fanfeedr::Conference.new(nfl_id, afc_id, @client)
      end

      context "attributes" do

        it "should return the id" do
          @afc.id.should == '919758e9-ef9e-5c1a-9b9b-42fccfb0d4e6'
        end

        it "should return the name" do
          @afc.name.should == 'AFC'
        end

        it "should return the level" do
          @afc.level.should == 'professional'
        end

        context ".league" do
          
          it "should return the league" do
            @afc.league.should be_an_instance_of Fanfeedr::League
          end

          it "should return the league name" do
            @afc.league.name.should == 'NFL'
          end
        end
      end
    end
  end
end
