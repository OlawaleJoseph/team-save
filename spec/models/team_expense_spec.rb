require 'rails_helper'

RSpec.describe TeamExpense, type: :model do
  subject { build :team_expense }

  context 'TeamExpense model' do
    context 'Validations' do
      it { should validate_presence_of(:confirmed) }
    end

    context 'Associations' do
      it { should belong_to(:team) }
      it { should belong_to(:expense) }
    end
  end
end
