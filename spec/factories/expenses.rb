FactoryBot.define do
  factory :expense do
    author
    name { 'New Home' }
    amount { 300 }
  end
end
