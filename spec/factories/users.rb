FactoryBot.define do
  factory :user, aliases: %i[author creator member] do
    first_name { 'John' }
    last_name { 'Doe' }
    username { 'tester' }
  end
end
