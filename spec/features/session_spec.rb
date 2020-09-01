require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  let(:person) { create :user }

  scenario 'Validate user input' do
    visit new_session_path

    fill_in 'user[username]', with: 'a'
    click_button 'Log In'
    puts page
    expect(page.current_path).to eq(sessions_path)
  end

  scenario 'Login registered user with valid username' do
    sign_in person

    expect(page).to have_content('Dashboard')
  end

  scenario 'Logout a user' do
    sign_in person

    sign_out
    expect(page).to have_content('Sign In')
  end
end
