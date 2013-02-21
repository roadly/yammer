module Yammer
  class Client
    # Defines methods related to manipulating users
    module Users
      def find_by_id(id, options={})
        response = get("users/#{id}", options, :json)
      end

      def users(options={})
        response = get("users", options, :json)
      end
    end
  end
end
