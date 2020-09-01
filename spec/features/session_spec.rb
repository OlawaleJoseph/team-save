require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  let(:person) { build :user }

  scenario 'Validate user input' do
    visit new_session_path

    fill_in 'Username', with: 'a'
    click_button 'Log In'
    puts page
    expect(page).to have_content("Invalid username")
  end

  scenario 'Login registered user with valid username' do
    sign_in :person

    expect(page).to have_content("Dashboard")
  end

  scenario 'Logout a user' do
    sign_in :person

    sign_out
    expect(page).to have_content("Dashboard")
  end
end

