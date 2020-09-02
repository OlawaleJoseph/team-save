module Helpers
  module Expense
    def create_expense(user)
      sign_in user

      visit new_expense_path

      fill_in 'expense[name]', with: 'test'
      fill_in 'expense[amount]', with: 200
      click_button 'Create'
    end

    def create_team(user)
      sign_in user

      visit new_team_path

      fill_in 'team[name]', with: 'test'
      fill_in 'team[logo]', with: Rails.root + 'img.jpeg'
      click_button 'Create'
    end
  end
end
