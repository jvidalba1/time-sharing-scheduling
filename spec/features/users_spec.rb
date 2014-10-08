require 'rails_helper'

feature 'Users' do

  scenario 'create new user by email provided' do
    visit root_path
    expect{
      fill_in 'Email', with: 'newuser@example.com'
      click_button 'Create User'
    }.to change(User, :count).by(1)
    expect(open_last_email).to be_delivered_to 'newuser@example.com'
    expect(open_last_email).to have_subject "Confirmation email"
    within 'h3' do
      expect(page).to have_content 'Please check your email'
    end
    expect(page).to have_content 'newuser@example.com'
  end


end