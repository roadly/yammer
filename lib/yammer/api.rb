require 'yammer/authentication'
require 'yammer/configuration'
require 'yammer/connection'
require 'yammer/request'

module Yammer
  # @private
  class API
    include Connection
    include Request
    include Authentication

    # @private
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Yammer.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
