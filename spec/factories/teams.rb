FactoryBot.define do
  factory :team do
    name { 'Pension' }
    creator factory: :user
  end
end
