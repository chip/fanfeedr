require "fanfeedr/league"
require "fanfeedr/client"
require "yaml"

describe Fanfeedr::League do

  let(:api_key) do
    file = File.dirname(__FILE__) + '/../support/fanfeedr.yml'
    YAML::load( File.open(file) )["key"]
  end
  subject { Fanfeedr::League.new("NFL", '13962b74-cab5-5d0a-93c8-466b6a3fa342', api_key) }

  # @fanfeedr = Fanfeedr.new(api_key)
  # or
  # @fanfeedr = Fanfeedr::Client.new(api_key)
  # 
  # @fanfeedr.leagues # => Fetch data, return Array of League objects
  # 
  # @fanfeedr.league("NFL") # => Fetch data from .leagues 
  #                         # => find id for league param
  #                         # => Fetch data for league with id
  #
  context "attributes" do

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
