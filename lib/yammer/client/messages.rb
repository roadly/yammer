module Yammer
  class Client
    # Defines methods related to timelines
    module Messages
      # Returns the 20 most recent messages in this network. Corresponds to the "Company Feed" tab on the website.
      #
      # @note Developers should note that a strict rate limit is applied to all API requests, so clients should never 
      #   poll for new messages more frequently than every 30 seconds to ensure that the user is still able to use the API for posting messages, etc.
      # @format :json, :xml
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @return [Array]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent messages in this network.
      #   Yammer.messages
      def messages(options={})
        response = get('messages', options)
        format.to_s.downcase == 'xml' ? response['response']['messages'] : response
      end

      # Returns the 20 sent messages by the current logged in user. Corresponds to the "Company Feed" tab on the website.
      # Alias for /api/v1/messages/from_user/logged-in_user_id.format. Corresponds to the "Sent" tab on the website.
      # 
      # @note Important to note that the XML format returns a different structure than the JSON one. So we only support the JSON format for this method.
      # @format :json
      # @authenticated true
      # @rate_limited true
      # @param options [Hash] A customizable set of options.
      # @return [Array]
      # @see http://developer.yammer.com/api/#message-viewing
      # @example Return the 20 most recent sent messages
      #   Yammer.messages_sent
      def messages_sent(options={})
        response = get('messages/sent', options, :json)
      end
      
      def messages_received(options={})
        response = get('messages/received', options, :json)
      end
      
      def direct_messages(options={})
        response = get('messages/private', options, :json)
      end
      
      def my_feed(options={})
        response = get('messages/following', options, :json)
      end
      
      def messages_from(id, options={})
        response = get("messages/from_user/#{id}", options, :json)
      end
    end
  end
end
