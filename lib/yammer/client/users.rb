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
      
      def in_group(group_id, options={})
        response = get("users/in_group/#{group_id}", options, :json)
      end

      def current(options={})
        response = get("users/current", options, :json)
      end

      def followers(name, options={})
        response = get("users/following/#{name}", options, :json)
      end

      def following(email, options={})
        response = get("users/by_email?email=#{email}", options, :json)
      end

    end
  end
end
