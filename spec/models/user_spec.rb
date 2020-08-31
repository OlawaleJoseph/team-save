require 'rails_helper'

RSpec.describe User, type: :model do
  context'User Model' do
    subject { build :user}

    scenario { should validate_presence_of(:first_name) }

    scenario { should validate_length_of(:first_name).is_at_least(3) }
    
    scenario { should validate_length_of(:first_name).is_at_most(50) }

    scenario { should validate_presence_of(:last_name) }

    scenario { should validate_length_of(:last_name).is_at_least(3) }
    
    scenario { should validate_length_of(:last_name).is_at_most(50) }
  
    scenario { should validate_presence_of(:username) }

    scenario { should validate_length_of(:username).is_at_least(3) }
    
    scenario { should validate_length_of(:username).is_at_most(50) }

    scenario { should validate_uniqueness_of(:username).case_insensitive }
  
    scenario { should be_valid }
  end

end
