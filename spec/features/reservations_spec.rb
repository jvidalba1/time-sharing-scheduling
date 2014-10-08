require 'rails_helper'

feature 'Reservations' do

  scenario 'create new reservation' do
    @user = FactoryGirl.create(:confirmed)
    visit new_user_reservation_path(@user)
    within 'h1' do
      expect(page).to have_content "Reservation form"
    end
    expect{
      # fill_in 'Date', with: '2014-10-22'
      # select('2014', :from => '#reservation_date_1i')
      page.find_by_id('reservation_date_1i').find("option[value='2014']").select_option
      page.find_by_id('reservation_date_2i').find("option[value='11']").select_option
      page.find_by_id('reservation_date_3i').find("option[value='25']").select_option
      fill_in 'Rooms', with: 2
      fill_in 'Trip reason', with: "just because"
      check 'Pool'
      click_button 'Create Reservation'
    }.to change(Reservation, :count).by(1)
    puts "oelo"
    expect(open_last_email).to be_delivered_to "tours@example.com"
    within 'h2' do
      expect(page).to have_content "#{@user.first_name} #{@user.last_name}"
    end
    within '.confirmation' do
      expect(page).to have_content "Your reservation was created succesfully"
    end
  end
end