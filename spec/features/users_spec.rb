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

  scenario 'clic in email confirmation when email hasnt been confirmated' do
    @user = FactoryGirl.create(:user)
    visit edit_user_url(@user)
    within 'h3' do
      expect(page).to have_content "Thank you, we're back"
    end
    expect{
      find('.user_first_name').fill_in 'First name', with: 'Mateo'
      # fill_in 'First name', with: 'New'
      fill_in 'Last name', with: 'Vidal'
      fill_in 'Phone number', with: '3008518308'
    }.to change(User, :count).by(0)
    click_button 'Update User'
    @user.reload
    # save_and_open_page
    expect(@user.first_name).to eq('Mateo')
    expect(@user.last_name).to eq('Vidal')
    expect(@user.phone_number).to eq('3008518308')
  end
end