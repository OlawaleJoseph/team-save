require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  context 'TeamMember Model' do
    subject { build :team_member }

    context 'Validations' do
      it { should validate_presence_of(:confirmed) }
    end
    context 'TeamMember model' do
      it { should belong_to(:team) }
      it { should belong_to(:member) }
    end
  end
end
