# frozen_string_literal: true

module Trackplus
  module Errors
    class TrackplusError       < StandardError; end
    class InvalidConfiguration < TrackplusError; end
    class NotAuthorized        < TrackplusError; end
    class InvalidResponse      < TrackplusError; end
    class NotFound             < TrackplusError; end
    class AlreadyExists        < TrackplusError; end
    class RequestToLong        < TrackplusError; end
    class MaxRetriesExceeded   < TrackplusError; end
  end
end
