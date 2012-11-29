require 'faraday'
require 'multi_json'

module Bcycle
  class Api
    URI = 'http://api.bcycle.com/Services/Mobile.svc/ListKiosks'

    class << self
      # Get all the kiosks from the API and return Bcycle::Kiosk objects
      # for each one
      def kiosks
        remote_data["d"]["list"].map { |kiosk| Kiosk.new(kiosk) }
      end

      # Find a single kiosk or nil
      def find(o)
        id = o.kind_of?(Bcycle::Kiosk) ? o.id.to_i : o.to_i
        kiosks.select { |k| k.id.to_i == id }.first
      end

      # Remote API data
      def remote_data
        resp = conn.get do |req|
          req.options[:timeout] = 10
        end
        MultiJson.load resp.body
      end

      def conn
        Faraday.new( :url => URI )
      end
    end
  end
end
