require 'spec_helper'

describe Bcycle::Api do
  it "The module should provide a .kiosks helper method to Api.kosks" do
    Bcycle.kiosks.should be_an(Array)
  end

  describe ".kiosk" do
    it "Should return an array of Bcycle::Kiosk objects" do
      Bcycle.kiosks.first.should be_a(Bcycle::Kiosk)
    end
  end
end
