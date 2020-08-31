FactoryBot.define do
  factory :team_expense do
    team factory: :team
    expense factory: :expense
  end
end
