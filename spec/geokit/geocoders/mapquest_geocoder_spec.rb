# -*- encoding : utf-8 -*-

require File.expand_path('../../../spec_helper', __FILE__)

describe Geokit::Geocoders::MapquestGeocoder do
  
  describe ".do_geocode" do
    it "should geocode complete addresses from Switzerland correctly" do
      result = GeoKit::Geocoders::MapquestGeocoder.do_geocode 'Langstrasse 11, 8004 Zurich, Schweiz'
      result.should be_success
      
      result.street_address.should == 'Langstrasse 11'
      result.zip.should            == '8004'
      result.city.should           == 'Zurich'
      result.country_code.should   == 'CH'
      result.lat.should be_within(0.001).of(47.374878)
      result.lng.should be_within(0.001).of( 8.524392)
    end
  end
end