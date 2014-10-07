require 'rails_helper'
require 'capybara/rails'

include Capybara::DSL

RSpec.describe "Pages", :type => :request do
  describe "GET /" do
    describe "Home page" do

      it "should have responde with status ok" do
        get new_user_path
        expect(response).to have_http_status(200)
      end

      it  "should have the content Welcome" do
        get new_user_path
        expect(view).to have_content
      end
    end
  end
end


# RSpec.describe "home page", :type => :request do
#   it "displays the user's username after successful login" do
#     user = User.create!(:username => "jdoe", :password => "secret")
#     get "/login"
#     assert_select "form.login" do
#       assert_select "input[name=?]", "username"
#       assert_select "input[name=?]", "password"
#       assert_select "input[type=?]", "submit"
#     end

#     post "/login", :username => "jdoe", :password => "secret"
#     assert_select ".header .username", :text => "jdoe"
#   end
# end