# frozen_string_literal: true

require 'json'
require 'uri'
require 'net/http'
require 'date'
require 'ostruct'
require 'cgi'
require 'forwardable'

require_relative 'trackplus/version'
require_relative 'trackplus/transformation'
require_relative 'trackplus/errors'
require_relative 'trackplus/client'

module Trackplus
  API_VERSION = 1
end
