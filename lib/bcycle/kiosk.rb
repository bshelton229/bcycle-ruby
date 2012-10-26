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
      # General
      @id = attrs["Id"]
      @name = attrs["Name"]
      @status = attrs["Status"]
      @bikes_available = attrs["BikesAvailable"]
      @docks_available = attrs["DocksAvailable"]
      @hours_of_operation = attrs["HoursOfOperation"]
      @is_event_based = attrs["IsEventBased"]
      @public_text = attrs["PublicText"]
      @total_docks = attrs["TotalDocks"]
      @time_zone = attrs["TimeZone"]

      # Location
      @lat = attrs["Location"]["Latitude"]
      @lng = attrs["Location"]["Longitude"]

      # Address
      @city = attrs["Address"]["City"]
      @state = attrs["Address"]["State"].upcase
      @street = attrs["Address"]["Street"]
      @zip = attrs["Address"]["ZipCode"]

      # Set attributes from defined instance variables
      @attributes = {}
      self.instance_variables.each do |i|
        i = i.to_s.gsub(/^@/, '')
        @attributes[i] = send(i.to_sym) if i != "attributes"
      end
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

    def is_event_based?
      @is_event_based ? true : false
    end
  end
end
