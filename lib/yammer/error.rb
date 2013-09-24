module Yammer

  # This gem seems to monkey patch faraday to catch certain exceptions
  # and even that attempt does not seem to be loaded anywhere, so instead
  # we'll catch the error on every request(and possibly elsewhere)
  # and then pass the exception to this class who will figure out the proper 
  # high level exception to raise
  class ErrorProxy
    def self.new(exception)
      return self.determine_exception(exception)
    end
    
    def self.determine_exception(exception)
      exception = exception
      message = exception.message
      status = exception.response[:status]
      headers = exception.response[:headers]

      case status.to_i
      when 400
        Yammer::BadRequest.new(error_message(message), headers)
      when 401
        Yammer::Unauthorized.new(error_message(message), headers)
      when 403
        Yammer::Forbidden.new(error_message(message), headers)
      when 404
        Yammer::NotFound.new(error_message(message), headers)
      when 429
        Yammer::TooManyRequests.new(error_message(message), headers)
      when 406
        Yammer::NotAcceptable.new(error_message(message), headers)
      when 500
        Yammer::InternalServerError.new(error_message("Something is technically wrong."), headers)
      when 502
        Yammer::BadGateway.new(error_message("Yammer is down or being upgraded."), headers)
      when 503
        Yammer::ServiceUnavailable.new(error_message("(__-){ Yammer is over capacity."), headers)
      else
        Exception.new("Unhandled Exception Status: #{status} - #{message}")
      end      
    end
  
    private
    def self.error_message(msg)
      #TODO: this can be used in the future to print nicer messages
      msg
    end
  end

  # Custom error class for rescuing from all Yammer errors
  class Error < StandardError
    attr_reader :http_headers

    def initialize(message, http_headers)
      @http_headers = Hash[http_headers]
      super message
    end

    def ratelimit_reset
      Time.at(@http_headers.values_at('x-ratelimit-reset', 'X-RateLimit-Reset').detect{|value| value}.to_i)
    end

    def ratelimit_limit
      @http_headers.values_at('x-ratelimit-limit', 'X-RateLimit-Limit').detect{|value| value}.to_i
    end

    def ratelimit_remaining
      @http_headers.values_at('x-ratelimit-remaining', 'X-RateLimit-Remaining').detect{|value| value}.to_i
    end

    def retry_after
      [(ratelimit_reset - Time.now).ceil, 0].max
    end
  end

  # Raised when Yammer returns the HTTP status code 400
  class BadRequest < Error; end

  # Raised when Yammer returns the HTTP status code 401
  class Unauthorized < Error; end

  # Raised when Yammer returns the HTTP status code 403
  class Forbidden < Error; end

  # Raised when Yammer returns the HTTP status code 404
  class NotFound < Error; end

  # Raised when Yammer returns the HTTP status code 406
  class NotAcceptable < Error; end

  # Raised when Yammer returns the HTTP status code 500
  class InternalServerError < Error; end

  # Raised when Yammer returns the HTTP status code 502
  class BadGateway < Error; end

  # Raised when Yammer returns the HTTP status code 503
  class ServiceUnavailable < Error; end

  # Raised when you hit Yammer's request rate limit
  class TooManyRequests < Error;end
end
