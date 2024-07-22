FactoryBot.define do
  factory :role do
    name { Faker::Job.title }
    description { Faker::Lorem.sentence }
  end

  trait :developer do
    name { 'developer' }
    description { 'Developers are responsible for developing software.' }
  end

  trait :product_owner do
    name { 'product owner' }
    description { 'Product Owners are responsible for the product backlog.' }
  end

  trait :tester do
    name { 'tester' }
    description { 'Testers are responsible for testing software.' }
  end
end
