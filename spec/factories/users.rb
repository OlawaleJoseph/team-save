FactoryBot.define do
  factory :user, aliases: [:author, :creator, :member] do
    first_name { 'John' }
    last_name { 'Doe' }
    username { 'tester' }
  end
end
