module Yammer
  class Client
    # Defines methods related to groups
    module Groups
      # Get groups information.
      # @see https://developer.yammer.com/api/#groups
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited unconfirmed
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :page 20 groups will be shown per page.
      # @option options [String] :letter Return groups beginning with the given letter.
      # @option options [messages|members|privacy|created_at|creator] :sort_by Results will be returned sorted by one of the above options instead of the default behavior of sorting by number of messages.
      # @option options [String] :reverse Return results in reverse order if uses true.
      # @option options [String] :private Used when creating or updating groups to make them private if uses true.
      # @return [Hashie::Mash] Informations of groups.
      def groups(options={})
        get("groups", options)
      end

      # Get specific group information.
      #
      # @format `:json`
      # @authenticated true
      # @rate_limited unconfirmed
      # @param id [Integer] The id of specific group.
      # @return [Hashie::Mash] Informations of group which id is #{id}.
      def group(id, options={})
        get("groups/#{id}", options)
      end

      # Create/Update group.
      #
      # @authenticated true
      # @rate_limited unconfirmed
      # @param name [String] The name of group.
      # @param private [String] Used true when creating or updating groups to make them private.
      def create_group(name, options={})
        post('groups', options.merge({:name => name}))
      end
    end
  end
end
