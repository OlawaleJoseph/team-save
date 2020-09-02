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

  context 'Team Invite' do
    let(:user) { create :user }
    let(:user) { create :user, username: 'test2' }
    scenario 'Accept team invite' do
      send_invite(user, user2)

      sign_in user2
      visit user_path(user2) + '/invitations'

      expect(page).to have_content('Accept')
      click_link 'Accept'
      expect(page).to have_content('TEST')
    end

    scenario 'Accept team invite' do
      send_invite(user, user2)

      sign_in user2
      visit user_path(user2) + '/invitations'

      expect(page).to have_content('Reject')
      click_link 'Reject'
      expect(page).not_to have_content('TEST')
    end
  end
end
