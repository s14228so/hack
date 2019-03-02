FactoryBot.define do
  factory :student do
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password){ |n| "TEST#{n}password"}
  end
end