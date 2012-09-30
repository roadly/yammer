module Yammer
  class Client
    # Defines methods related to manipulating users
    module Users
      # Returns 50 users per page in your network
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited ***
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :page Only 50 results of each type will be returned for each page, but a total count is returned with each query. page=1 (the default) will return items 1-50, page=2 will return items 51-100, etc.
      # @option options [String] :letter Return users beginning with the given letter.
      # @option options [String] :sort_by [ messages | followers ] Results will be returned sorted by number of messages or followers, instead of the default behavior of sorting alphabetically.
      # @option options [Boolean] :reverse Return results in reverse order.
      # @option options [Boolean] :delete The DELETE method on a user resource will suspend that user's account, allowing the user to reactivate through the website if they have access to a company email address. Passing delete=true along with the request will cause the account to be deleted, which cannot be undone by the user.
      # @return [Hashie::Mash]
      # @see https://developer.yammer.com/api/#users
      # @example
      #   Yammer.users
      def users(options={})
        get('users', options)
      end

      # View data about one user.
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited ***
      # @param id [Integer/String] the user_id you want to view data
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :page Only 50 results of each type will be returned for each page, but a total count is returned with each query. page=1 (the default) will return items 1-50, page=2 will return items 51-100, etc.
      # @option options [String] :letter Return users beginning with the given letter.
      # @option options [String] :sort_by [ messages | followers ] Results will be returned sorted by number of messages or followers, instead of the default behavior of sorting alphabetically.
      # @option options [Boolean] :reverse Return results in reverse order.
      # @option options [Boolean] :delete The DELETE method on a user resource will suspend that user's account, allowing the user to reactivate through the website if they have access to a company email address. Passing delete=true along with the request will cause the account to be deleted, which cannot be undone by the user.
      # @return [Hashie::Mash]
      # @see https://developer.yammer.com/api/#users
      # @example
      #   Yammer.user(3866451)
      def user(id, options={})
        get("users/#{id}", options)
      end
    end
  end
end
