module Yammer
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, format=format)
      request(:get, path, options, format)
    end

    # Perform an HTTP POST request
    def post(path, options={}, format=format)
      request(:post, path, options, format)
    end

    # Perform an HTTP PUT request
    def put(path, options={}, format=format)
      request(:put, path, options, format)
    end

    # Perform an HTTP DELETE request
    def delete(path, options={}, format=format)
      request(:delete, path, options, format)
    end

    private

    # Perform an HTTP request
    def request(method, path, options, format)
      begin
        case method.to_sym
        when :get, :delete
          response = connection.send(method, formatted_path(path, format))
        when :post, :put
          raise "POST and PUT verbs are not yet supported!"
          # request.path = formatted_path(path, format)
          # request.body = options unless options.empty?
        end
      
      #TODO: format is not obeyed.  From Yam we get back an array of objects
      response
      
      rescue MultiJson::DecodeError
        Hashie::Mash.new
      rescue Faraday::Error::ClientError => e
        raise Yammer::ErrorProxy.new(e)

      end
    end

    def formatted_path(path, format)
      #paths must have a leading /
      path = "/#{path}" if path[0] != "/"
      case format.to_s.downcase
      when 'json', 'xml'
        [path, format].compact.join('.')
      when 'raw'
        [path, Yammer.format].compact.join('.')
      end
    end
  end
end
