require 'rails_helper'

RSpec.describe User, type: :model do
  context'User Model' do
    let(:user) { build :user}
    scenario "must have first name" do
      user.first_name = nil
      expect(user.valid?).to be false
    end

    scenario "first name should have not less than 3 characters" do
      user.first_name = 'aa'
      expect(user.valid?).to be false
    end

    scenario "first name should have not more than 50 characters" do
      user.first_name = 'a' * 51
      expect(user.valid?).to be false
    end
  
    scenario "must have last name" do
      user.last_name = nil
      expect(user.valid?).to be false
    end
    scenario "last name should have not less than 3 characters" do
      user.last_name = 'aa'
      expect(user.valid?).to be false
    end

    scenario "last name should have not more than 50 characters" do
      user.last_name = 'a' * 51
      expect(user.valid?).to be false
    end
  
    scenario "must have username" do
      user.username = nil
      expect(user.valid?).to be false
    end

    scenario "username should have not less than 3 characters" do
      user.username = 'aa'
      expect(user.valid?).to be false
    end

    scenario "user name should have not more than 50 characters" do
      user.username = 'a' * 51
      expect(user.valid?).to be false
    end

    scenario "user name should be unique" do
      create :user
      expect(user.valid?).to be false
    end
  
    scenario "Should be valid" do
      expect(user.valid?).to be true
    end
  end

end
