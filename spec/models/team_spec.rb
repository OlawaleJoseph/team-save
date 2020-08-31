require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'Team Model' do
    subject { build :team }

    context 'Validations' do
      scenario { should validate_presence_of(:name) }

      scenario { should validate_length_of(:name).is_at_least(3) }

      scenario { should validate_length_of(:name).is_at_most(20) }

      scenario { should be_valid }
    end

    context 'Associations' do
      scenario { should belong_to(:creator) }
      scenario { should have_many(:team_members)}
      scenario { should have_many(:members).through(:team_members) }
      scenario { should have_many(:team_expenses)}
      scenario { should have_many(:expenses).through(:team_expenses) }
    end
  end
end
