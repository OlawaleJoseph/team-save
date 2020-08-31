FactoryBot.define do
  factory :team_member do
    member
    team
    confirmed { false }
  end
end
