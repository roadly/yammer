module Yammer
  # @private
  module Authentication
    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      authentication.values.all?
    end
    
    private

    # Authentication hash
    #
    # @return [Hash]
    def authentication
      {
        oauth_token: oauth_token
      }
    end

  end
end
