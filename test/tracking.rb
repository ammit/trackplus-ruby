# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/trackplus'))
require './config.rb'

TrackPlus.api_key = TestConfig.api_key

puts TrackPlus::V1::Tracking.create('RA123456780HK', emails: ['a@abcd.com', 'asdfasdfs@gmail.com'])

puts TrackPlus::V1::Tracking.get('hong-kong-post', 'RA123456780HK')
puts TrackPlus::V1::Tracking.get_all
puts TrackPlus::V1::Tracking.export

puts TrackPlus::V1::Tracking.update('hong-kong-post', 'RA123456780HK', title: 'Testing')

puts TrackPlus::V1::Tracking.delete('hong-kong-post', 'RA123456780HK')

# puts TrackPlus::V1::Tracking.reactivate('hong-kong-post', 'RA123456780HK')
# puts TrackPlus::V1::Tracking.create('1ZA6F598D992381375')
#
#
# last_checkpoint = TrackPlus::V1::LastCheckpoint.get('ups', '1ZA6F598D992381375')
# puts last_checkpoint.to_json
#
#
# puts couriers = TrackPlus::V1::Courier.get
# puts detect = TrackPlus::V1::Courier.detect('RA123456789HK')
