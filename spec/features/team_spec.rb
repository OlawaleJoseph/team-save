require 'rails_helper'

RSpec.feature "Teams", type: :feature do
  let(:person) { create :user }

  context 'Create Team' do
    scenario 'prevents guest users from creating team' do
      visit new_team_path

      expect(page.current_path).to eq(new_session_path)
    end

    scenario 'Validate user input' do
      sign_in person

      visit new_team_path

      fill_in 'team[name]', with: 'a'
      click_button 'Create'
      expect(page.current_path).to eq(teams_path)
      expect(page).to have_content('Name is too short (minimum is 2 characters)')
    end

    scenario 'valid parameters given' do
      expect { create_team person }.to change { Team.count }.by(1)
      expect(Team.last.id).to eq(person.id)
      expect(page.current_path).to eq('teams/1')
      expect(page).to have_content('test')
    end

    scenario 'unique team name' do
      create_team person 

      expect { create_expense person }.to no_change { Team.count }
      expect(page).to have_content('name taken')
    end
  end

  context 'Single Team' do
    scenario 'Show a team' do
      create_team person
      visit team_path(1)

      expect(page).to have_content('test')
    end

    scenario 'Delete a team' do
      create_team person
      visit team_path(1)

      expect { click_link 'Delete' }.to change { Team }.by(-1)
      expect(page.current_path).to eq(teams_path)
      expect(page).to have_no_content('test')
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
