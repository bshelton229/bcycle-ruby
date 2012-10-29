require 'spec_helper'

describe "Bcycle Finders" do
  use_vcr_cassette "bcycle", :allow_playback_repeats => true

  it "Should provide a .find method to get a particular station by id" do
    first = Bcycle.kiosks.first
    Bcycle.find(first.id).name.should eq(first.name)
  end
end