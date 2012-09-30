require 'helper'

describe Yammer::API do

  before do
    @client = Yammer::Client.new
  end

  describe "#users" do
    before do
      stub_get("users.json").
        to_return(:body => fixture("users.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the right resource" do
      @client.users
      a_get("users.json").
        should have_been_made
    end
    it "returns 3 users" do
      users = @client.users
      users.count.should eq 3
    end
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
