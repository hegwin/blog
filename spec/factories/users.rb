FactoryBot.define do
  factory :user do
    name                  { Faker::Internet.user_name }
    password              { "P4$$word" }
    password_confirmation { "P4$$word" }
  end
end
