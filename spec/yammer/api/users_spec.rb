require 'helper'

describe Yammer::API do

  before do
    @client = Yammer::Client.new
  end

  describe "#users" do
  end

  describe "#user" do
    context "with a uid passed" do
      before do
        stub_get("users/3866451.json").
          to_return(:body => fixture("bruno.json"), :headers => {:content_type => "application/json; charset=utf-8"})
      end
      it "requests the correct resource" do
        @client.user("3866451")
        a_get("users/3866451.json").
          should have_been_made
      end
      it "returns extended information of a given user" do
        user = @client.user("3866451")
        user.first_name.should eq "Bruno"
      end
    end
  end

end
