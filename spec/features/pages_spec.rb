require 'rails_helper'

feature 'Pages' do
  scenario 'home page respond with status ok' do
    visit root_path
    expect(page).to have_http_status(200)
  end

  scenario 'home page has the content Welcome' do
    visit root_path
    expect(page).to have_content 'Welcome'
  end
end

# RSpec.describe "Pages", :type => :request do
#   describe "GET /" do
#     describe "Home page" do

#       it "should have responde with status ok" do
#       end

#       it  "should have the content Welcome" do
#         get new_user_path
#         expect(page).to have_content("Welcome")
#       end
#     end
#   end
# end


# feature'Usermanagement'do
# 4 scenario "adds a new user" do
# 5 admin = create(:admin)
# 6
# 7 visit root_path
# 8 click_link 'Log In'
# 9 fill_in 'Email', with: admin.email
# 10 fill_in 'Password', with: admin.password
# 11 click_button 'Log In'
# 12
# 13 visit root_path
# 14 expect{
# 15 click_link 'Users'
# 16 click_link 'New User'
# 17 fill_in 'Email', with: 'newuser@example.com'
# 18 find('#password').fill_in 'Password', with: 'secret123'
# 19 find('#password_confirmation').fill_in 'Password confirmation',
# 20 with: 'secret123'
# 21 click_button 'Create User'
# 22 }.to change(User, :count).by(1)
# 23 expect(current_path).to eq users_path
# 24 expect(page).to have_content 'New user created'
# 25 within 'h1' do
# 26 expect(page).to have_content 'Users'
# 27 end
# 28 expect(page).to have_content 'newuser@example.com'
# 29 end
# 30 end