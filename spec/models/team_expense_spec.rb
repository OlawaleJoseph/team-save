require 'rails_helper'

RSpec.describe TeamExpense, type: :model do
  context 'TeamExpense model' do
    subject { build :team_expense }

    context 'Associations' do
      it { should belong_to(:team) }
      it { should belong_to(:expense) }
    end
  end
end
