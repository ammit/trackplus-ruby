# frozen_string_literal: true

class TestConfig
  class << self
    attr_accessor :api_key
  end
  self.api_key = 'api-key'
end
