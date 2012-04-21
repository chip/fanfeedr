require "fanfeedr"

describe Fanfeedr do

  it "should have an API endpoint" do
    Fanfeedr::API_ENDPOINT.should == 'http://ffapi.fanfeedr.com/basic/api'
  end

end
