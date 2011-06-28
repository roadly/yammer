require 'faraday'

# @private
module Faraday
  # @private
  class Response::RaiseHttp5xx < Response::Middleware
    def on_complete(env)
      case env[:status].to_i
      when 500
        raise Yammer::InternalServerError.new(error_message(env, "Something is technically wrong."), env[:response_headers])
      when 502
        raise Yammer::BadGateway.new(error_message(env, "Yammer is down or being upgraded."), env[:response_headers])
      when 503
        raise Yammer::ServiceUnavailable.new(error_message(env, "(__-){ Yammer is over capacity."), env[:response_headers])
      end
    end

    private

    def error_message(env, body=nil)
      "#{env[:method].to_s.upcase} #{env[:url].to_s}: #{[env[:status].to_s + ':', body].compact.join(' ')} Check http://status.Yammer.com/ for updates on the status of the Yammer service."
    end
  end
end
