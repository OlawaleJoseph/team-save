require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  let(:user) { create :user }

  context 'Login' do
    scenario "should not login a user that doesn't exist" do
      visit new_session_path

      fill_in 'Username', with: 'not_exist'
      click_button 'Log In'

      expect(page.current_path).to eq(sessions_path)
    end

    scenario 'Should login an existing user' do
      visit new_session_path

      fill_in 'Username', with: user.username
      click_button 'Log In'

      expect(page.current_path).to eq(expenses_path)
      expect(page).to have_content('Dashboard')
    end
  end

  context 'Logout' do
    scenario 'Should login an existing user' do
      visit new_session_path

      fill_in 'Username', with: user.username
      click_button 'Log In'
      click_link 'Logout'

      expect(page.current_path).to eq(logout_path)
    end
  end
end
