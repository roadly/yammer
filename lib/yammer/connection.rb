module Yammer
  # @private
  module Connection
    private

    def connection(format=format)
      Yam.new(oauth_token, endpoint)
    end
  end
end
