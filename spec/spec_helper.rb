# -*- encoding : utf-8 -*-

$:.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'
require 'geokit/mapquest_geocoder'

unless ENV['MAPQUEST_KEY']
  puts "you must set the MAPQUEST_KEY environment variable to a valid mapquest key for the specs to run"
  exit 1
end
