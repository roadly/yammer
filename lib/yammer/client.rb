module Yammer
  # Wrapper for the Yammer REST API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {http://developer.yammer.com/api/ the Yammer API Documentation}.
  # @note From Yammer: When polling for messages, do not exceed one poll per minute. Clients polling excessively will be blocked. However, you may sometimes need to fetch messages more frequently than once per minute, for example, if a user flips between "following", "sent" and "received" feeds quickly), and this is allowed for a few requests. Do not attempt to decrease message latency in your client by checking for new messages more frequently than once per minute.
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'yammer/client/messages'
    require 'yammer/client/feed'
    require 'yammer/client/users'
    require 'yammer/client/groups'

    alias :api_endpoint :endpoint

    include Yammer::Client::Messages
    include Yammer::Client::Feed
    include Yammer::Client::Users
    include Yammer::Client::Groups
  end
end
