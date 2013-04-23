# -*- encoding : utf-8 -*-

module Geokit
  module Geocoders
    class MapquestGeocoder < Geocoder
      
      def self.do_geocode(address, opts={})
        address  = address.is_a?(GeoLoc) ? address.to_geocodeable_s : address
        url      = "http://open.mapquestapi.com/geocoding/v1/address?key=#{ENV['MAPQUEST_KEY']}&maxResults=1&thumbMaps=false&outFormat=json&location=#{Geokit::Inflector::url_escape(address)}"
        response = self.call_geocoder_service(url)
        
        data = MultiJson.decode(response.body)['results'].first['locations'].first
        
        GeoLoc.new.tap do |loc|
          loc.success        = true
          loc.street_address = data['street']
          loc.zip            = data['postalCode']
          loc.city           = data['adminArea5']
          loc.state          = data['adminArea4']
          loc.country_code   = data['adminArea1']
          loc.lat            = data['latLng']['lat']
          loc.lng            = data['latLng']['lng']
        end
      end
    end
  end
end