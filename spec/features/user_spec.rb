require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  subject { build :user }

  scenario 'Validate user input' do
    visit new_user_path
    fill_in 'First name', with: ''
    fill_in 'Last name', with: subject.last_name
    fill_in 'Username', with: subject.username
    click_button 'Register'

    expect(page).to have_content(
      "First name can't be blank and First name is too short (minimum is 3 characters)"
    )
  end

  scenario 'Register a user without avatar' do
    visit new_user_path
    fill_in 'First name', with: subject.first_name
    fill_in 'Last name', with: subject.last_name
    fill_in 'Username', with: subject.username
    click_button 'Register'

    expect(page).to have_content('Dashboard')
  end

  scenario 'Register a user with an avatar' do
    visit new_user_path
    fill_in 'First name', with: subject.first_name
    fill_in 'Last name', with: subject.last_name
    fill_in 'Username', with: subject.username
    attach_file('user[avatar]', Rails.root + 'app/assets/images/img.jpeg')
    click_button 'Register'

    expect(page).to have_content('Dashboard')
  end
end
