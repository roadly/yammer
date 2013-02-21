require 'yammer/version'

module Yammer
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {Yammer::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :endpoint,
      :format,
      :gateway,
      :oauth_token,
      :proxy,
      :user_agent].freeze

    # The adapter that will be used to connect if none is set
    DEFAULT_ADAPTER = :net_http

    # The endpoint that will be used to connect if none is set
    #
    # @note This is configurable in case you want to use HTTP instead of HTTPS, specify a different API version.
    DEFAULT_ENDPOINT = 'https://www.yammer.com/api/v1/'.freeze

    # The response format appended to the path and sent in the 'Accept' header if none is set
    #
    # @note JSON is preferred over XML because it is more concise and faster to parse.
    DEFAULT_FORMAT = :json

    # By default, don't set a user oauth token
    DEFAULT_OAUTH_TOKEN = nil

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "Yammer Ruby Gem #{Yammer::VERSION}".freeze

    DEFAULT_GATEWAY = nil

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.endpoint           = DEFAULT_ENDPOINT
      self.format             = DEFAULT_FORMAT
      self.oauth_token        = DEFAULT_OAUTH_TOKEN
      self.proxy              = DEFAULT_PROXY
      self.user_agent         = DEFAULT_USER_AGENT
      self.gateway            = DEFAULT_GATEWAY
      self
    end
  end
end
