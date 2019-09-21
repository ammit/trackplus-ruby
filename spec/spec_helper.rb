# frozen_string_literal: true

# require 'rubygems'
# require 'bundler/setup'
# require 'pry'
# Bundler.setup

require_relative '../lib/trackplus'
require_relative 'fixtures'
require 'webmock/rspec'

RSpec.configure do |config|
  config.after(:each) do
    WebMock.reset!
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    # mocks.verify_partial_doubles = true
  end

  config.warnings = true
end
