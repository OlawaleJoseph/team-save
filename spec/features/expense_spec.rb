require 'rails_helper'

RSpec.feature "Expenses", type: :feature do
  let(:person) { create :user }

  context 'Create Expense' do
    scenario 'prevents guest users from creating expenses' do
      visit new_expense_path

      expect(page.current_path).to eq(new_session_path)
    end

    scenario 'Validate user input' do
      sign_in person

      visit new_expense_path

      fill_in 'expense[name]', with: 'a'
      fill_in 'expense[amount]', with: 200
      click_button 'Create'
      expect(page.current_path).to eq(expenses_path)
      expect(page).to have_content('Name is too short (minimum is 2 characters)')
    end

    scenario 'valid parameters given' do
      
      expect{ create_expense person}.to change{Expense.count}.by(1)
      expect(Expense.last.id).to eq(person.id)
      expect(page.current_path).to eq(expenses_path)
      expect(page).to have_content('test')
    end
  end

  context 'Single Expense' do
    
    scenario 'Show an expense' do
      create_expense person
      visit expense_path(1)

      expect(page).to have_content('test')
    end

    scenario 'Delete an expense' do
      create_expense person
      visit expense_path(1)
      click_link 'Delete'
      expect{ click_link 'Delete' }.to change{Expense.count}.by(1)
      expect(page.current_path).to eq(expenses_path)
      expect(page).to not_have_content('test')
    end

  end


  
end
