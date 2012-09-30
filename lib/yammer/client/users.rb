module Yammer
  class Client
    # Defines methods related to manipulating users
    module Users
      # Returns a list of users in our network
      def users(options={})
        get('users', options)
      end

      # Returns a particular user
      def user(id, options={})
        get("users/#{id}", options)
      end
    end
  end
end
