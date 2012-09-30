module Yammer
  class Client
    # Defines methods to get/declines suggestions.
    module Suggestions
      # Return suggested groups and users.
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited 
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :limit Returns only Return only the specified number of suggestions.
      # @return [Hashie::Mash]
      # @see https://developer.yammer.com/api/#suggestions
      # @example
      # Yammer.suggestions
      def suggestions(options={})
        get('suggestions', options)
      end

      # Decline a suggestion specfic id.
      # @param id [Integer/String] When declining a suggestion, pass its id.
      # @example
      # Yammer.decline_suggestion(12345)
      def decline_suggestion(id)
        delete("suggestions/#{id}")
      end
    end
  end
end
