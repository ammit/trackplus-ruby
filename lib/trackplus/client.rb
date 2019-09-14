# frozen_string_literal: true

module Trackplus
  class Client
    def initialize(options = {})
      @api_key = options.fetch(:api_key) { configuration_error 'Missing api_key argument' }
      @transform_to = Transformation.new(options[:transform_to])
    end

    # returns a collection of your account members
    def tracking(courier:, tracking_no:)
      @transform_to.apply(nil, get_request("trackings/#{courier}/#{tracking_no}")['data'])
    end

    def couriers
      @transform_to.apply(nil, get_request('couriers')['data'])
    end

    private

    attr_reader :api_key

    # do the get request to api
    def get_request(url, params = {})
      params = URI.encode_www_form(params.keep_if { |k, v| k && v })
      full_url = params.empty? ? url : [url, params].join('?')
      do_request(full_url, Net::HTTP::Get)
    end

    # generic part of requesting api
    def do_request(url, type, &_block)
      uri = URI.parse("#{api_url}/#{url}")
      http = Net::HTTP.new(uri.host, uri.port)
      # http.use_ssl = true

      request = type.new(uri.request_uri, headers)

      yield request if block_given?

      response = http.request(request)

      parse!(response)
    end

    # parse the api response
    def parse!(response)
      case response.code.to_i
      when 204, 205
        nil
      when 200...300
        JSON.parse(response.body) unless response.body.to_s.empty?
      when 401
        raise Errors::NotAuthorized, JSON.parse(response.body)['error']
      when 404
        raise Errors::NotFound, JSON.parse(response.body)['error']
      when 422
        handle_response_422(response)
      when 503
        raise Errors::RequestToLong, response.body
      else
        raise Errors::InvalidResponse, "Response code: #{response.code} message: #{response.body}"
      end
    end

    # default headers for authentication and JSON support
    def headers
      {
        'Accept' => 'application/json',
        'Authorization' => "Bearer #{api_key}",
        'Content-Type' => 'application/json',
        'User-Agent' => 'Workable Ruby Client'
      }
    end

    # build the url to api
    def api_url
      @_api_url ||= format('http://167.71.238.124/api/v%s', Trackplus::API_VERSION)
    end

    def configuration_error(message)
      raise Errors::InvalidConfiguration, message
    end
  end
end
