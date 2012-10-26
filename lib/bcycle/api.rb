require 'open-uri'
module Bcycle
  class Api
    URI = 'http://api.bcycle.com/Services/Mobile.svc/ListKiosks'
    class << self
      # Get all the kiosks from the API and return Bcycle::Kiosk objects
      # for each one
      def kiosks
        remote_data["d"]["list"].map { |kiosk| Kiosk.new(kiosk) }
      end

      # Remote API data
      def remote_data
        # TODO: Error handling
        JSON.parse(open(URI).read)
      end
    end
  end
end
