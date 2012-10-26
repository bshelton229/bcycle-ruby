require 'json'
require 'open-uri'
require "bcycle/version"
require "bcycle/kiosk"
require "bcycle/api"

module Bcycle
  def self.kiosks
    Api.kiosks
  end
end
