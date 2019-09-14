# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/trackplus'))
require './config.rb'

# config
TrackPlus.api_key = TestConfig.api_key

# puts couriers = TrackPlus::V1::Courier.get

puts detect = TrackPlus::V1::Courier.detect(tracking_number: 'RA123456789HK')
