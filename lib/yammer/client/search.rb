module Yammer
  class Client
    # Defines methods related to search
    module Search
      # Returns the 20 lists of messages, users, tags and groups that match the user's search query.
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited ***
      # @param query [String] The search query.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :page Only 20 results of each type will be returned for each page, but a total count is returned with each query. page=1 (the default) will return items 1-20, page=2 will return items 21-30, etc.
      # @option options [Integer] :num_per_page limit of search results, up to a maximum of 20, the default value. 
      # @return [Hashie::Mash]
      # @see https://developer.yammer.com/api/#search
      # @example 
      #   Yammer.search("my boss")
      def search(query, options={})
        get('search', options.merge({:search => query}))
      end
    end
  end
end

