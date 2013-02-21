module Yammer
  # @private
  module Authentication
    private

    # Authentication hash
    #
    # @return [Hash]
    def authentication
      {
        oauth_token: oauth_token
      }
    end

    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      authentication.values.all?
    end
  end
end
