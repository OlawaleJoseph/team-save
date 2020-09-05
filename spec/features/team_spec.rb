require 'rails_helper'

RSpec.feature 'Teams', type: :feature do
  let(:person) { create :user }

  context 'Create Team' do
    scenario 'prevents guest users from creating team' do
      visit new_team_path

      expect(page.current_path).to eq(new_session_path)
    end

    scenario 'Should not create a team with invalid input' do
      sign_in person

      visit new_team_path

      fill_in 'team[name]', with: 'a'
      attach_file('team[image]', Rails.root + 'app/assets/images/img.jpeg')
      click_button 'Create'
      expect(page.current_path).to eq(teams_path)
    end

    scenario 'Shoud Create a team' do
      expect { create_team person }.to change { Team.count }.by(1)
      expect(Team.last.creator.id).to eq(person.id)
      expect(page.current_path).to eq('/teams')
      expect(page).to have_content('My Teams')
    end

    scenario 'Should not create duplicate teams' do
      create_team person

      expect { create_team person }.not_to(change { Team.count })
      expect(page).to have_content('Name has already been taken')
    end
  end

  context 'Team' do
    let(:invitee) { create :user, username: 'invitee' }
    scenario 'Show a team' do
      create_team person
      visit teams_path(1)

      expect(page).to have_content('test')
    end

    scenario 'Send Invite' do
      create_team person
      visit teams_path(1)

      fill_in 'username', with: invitee.username

      expect { click_button 'Invite' }.to(change { TeamMember.count }.by(1))
    end

    scenario 'Should not send Invite' do
      create_team person
      visit teams_path(1)

      fill_in 'username', with: 'test'

      expect { click_button 'Invite' }.not_to(change { TeamMember.count })
    end

    scenario 'Delete a team' do
      create_team person

      expect { click_link 'Delete' }.to change { Team.count }.by(-1)
      expect(page.current_path).to eq(teams_path)
      expect(page).to have_no_content('Test')
    end
  end
  context 'All Teams' do
    scenario 'Show' do
      create_team person
      visit teams_path

      expect(page).to have_content('My Teams')
    end
  end
end
