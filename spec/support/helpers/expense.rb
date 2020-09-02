module Helpers
  module Expense
    def create_expense(user)
      sign_in user

      visit new_expense_path

      fill_in 'expense[name]', with: 'test'
      fill_in 'expense[amount]', with: 200
      click_button 'Create'
    end
  end
end
