require 'spec_helper'

describe Bcycle::Kiosk do
  before(:each) do
    @kiosk ||= Bcycle.kiosks.select { |k| k.state == 'WI' }.first
  end

  it "Should provides attributes" do
    # @kiosk = Bcycle.kiosks.first
    @kiosk.should be_a(Bcycle::Kiosk)
    @kiosk.attributes.should be_a(Hash)
    @kiosk.attributes.count.should eq(@kiosk.instance_variables.count - 1)
  end

  it "Should not add attributes to the attributes array" do
    @kiosk.attributes.keys.should_not include("attributes")
  end
end