module Bcycle
  class Kiosk
    # General
    attr_reader :id, :name, :status, :bikes_available, :docks_available, :hours_of_operation, :is_event_based, :public_text, :total_docks, :time_zone
    # Location
    attr_reader :lat, :lng
    # Address
    attr_reader :city, :state, :street, :zip
    # Attributes
    attr_reader :attributes

    def initialize(attrs={})
      @attributes = normalize_attributes(attrs)
      @attributes.each do |name, value|
        instance_variable_set "@#{name}", value
      end
    end

    # Normalize attributes
    # This will also detect whether or not we're rebuilding from a serialized
    # Bcycle::Kiosk or from the API response
    def normalize_attributes(a)
      o = {}

      # General Attributes
      o["id"] = a["Id"] || a["id"].to_i
      o["name"] = a["Name"] || a["name"]
      o["status"] = a["Status"] || a["status"]
      o["bikes_available"] = a["BikesAvailable"] || a["bikes_available"].to_i
      o["docks_available"] = a["DocksAvailable"] || a["docks_available"].to_i
      o["hours_of_operation"] = a["HoursOfOperation"] || a["hours_of_operation"]

      o["is_event_based"] = a["IsEventBased"].nil? ? ( o["is_event_based"] || false ) : a["IsEventBased"]

      o["public_text"] = a["PublicText"] || a["public_text"]
      o["total_docks"] = a["TotalDocks"] || a["total_docks"].to_i
      o["time_zone"] = a["TimeZone"] || a["time_zone"]

      # Location
      o["lat"] = a["Location"] ? a["Location"]["Latitude"] : a["lat"].to_f
      o["lng"] = a["Location"] ? a["Location"]["Longitude"] : a["lng"].to_f

      # Address
      o["city"] = a["Address"] ? a["Address"]["City"] : a["city"]
      o["state"] = a["Address"] ? a["Address"]["State"].upcase : a["state"]
      o["street"] = a["Address"] ? a["Address"]["Street"].upcase : a["street"]
      o["zip"] = a["Address"] ? a["Address"]["ZipCode"].upcase : a["zip"]

      o
    end

    def address
      "#{@street}, #{@city}, #{@state} #{@zip}"
    end

    def latlng
      [ @lat, @lng ]
    end

    def active?
      @status == 'Active'
    end

    def ==(*args)
      if args.first.kind_of?(Bcycle::Kiosk)
        k = args.first
        k.id == self.id
      else
        super
      end
    end

    def is_event_based?
      @is_event_based ? true : false
    end

    def as_json(opts={})
      @attributes.merge({ :latlng => latlng, :active => self.active? })
    end

    def to_json(*a)
      as_json.to_json(*a)
    end
  end
end
