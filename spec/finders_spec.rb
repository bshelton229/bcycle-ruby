require 'spec_helper'

describe "Bcycle Finders", :vcr => true do
  it "Should provide a .find method to get a particular station by id" do
    first = Bcycle.kiosks.first
    Bcycle.find(first.id).name.should eq(first.name)
  end
end