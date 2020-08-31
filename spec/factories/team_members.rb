FactoryBot.define do
  factory :team_member do
    member factory: :user
    team factory: :team
    confirmed { false }
  end
end
