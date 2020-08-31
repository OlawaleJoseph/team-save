require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'Expense Model' do
    subject { build :expense }

    context 'Validation' do

      scenario { should validate_presence_of(:name) }

      scenario { should validate_length_of(:name).is_at_least(2) }

      scenario { should validate_length_of(:name).is_at_most(20) }

      scenario { should validate_presence_of(:amount) }

      scenario { should validate_numericality_of(:amount).is_greater_than_or_equal_to(1) }

      scenario { should be_valid }
    end

    context 'Association' do
      scenario { should belong_to(:author)}
    end
  end
end
