module Yammer
  # Wrapper for the Yammer REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {http://developer.yammer.com/api/ the Yammer API Documentation}.
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'yammer/client/messages'

    alias :api_endpoint :endpoint

    include Yammer::Client::Messages
  end
end
