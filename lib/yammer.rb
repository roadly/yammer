require 'yammer/api'
require 'yammer/client'
require 'yammer/configuration'
require 'yammer/error'

module Yammer
  extend Configuration
  class << self
    # Alias for Yammer::Client.new
    #
    # @return [Yammer::Client]
    def new(options={})
      Yammer::Client.new(options)
    end

    # Delegate to Yammer::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
