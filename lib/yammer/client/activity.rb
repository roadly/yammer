module Yammer
  class Client
    module Activity
      def new_activity(options={})
        response = post('activity', options)
      end
    end
  end
end