FactoryBot.define do
  factory :team do
    name { 'Pension' }
    creator factory: :user
  end

  def user_with_teams(team_count = 5)
    FactoryBot.create(:user) do |user|
      FactoryBot.create_list(:team, team_count, user: user)
    end
  end
end
