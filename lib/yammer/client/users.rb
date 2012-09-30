module Yammer
  class Client
    # Defines methods related to manipulating users
    module Users
      # Returns a list of users in our network
      def users(options={})
        response = get("users", options, :json)
      end

      # Returns a particular user
      def user(id, options={})
        response = get("users/#{id}", options, :json)
      end
    end
  end
end
