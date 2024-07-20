FactoryBot.define do
  factory :membership do
    association :team
    association :user
    association :role
  end
end
