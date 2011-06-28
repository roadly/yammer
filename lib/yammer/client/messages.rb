module Yammer
  class Client
    # Defines methods related to timelines
    module Messages
      # Returns the 20 most recent messages in this network. Corresponds to the "Company Feed" tab on the website.
      #
      # @note Developers should note that a strict rate limit is applied to all API requests, so clients should never poll for new messages more frequently than every 30 seconds to ensure that the user is still able to use the API for posting messages, etc.
      # @format :json, :xml
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @return [Array]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent statuses, including retweets if they exist, from non-protected users
      #   Yammer.messages
      def messages(options={})
        response = get('messages', options)
        format.to_s.downcase == 'xml' ? response['messages'] : response
      end
    end
  end
end
