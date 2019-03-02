FactoryBot.define do
  factory :student do
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password){ |n| "TEST#{n}password"}
    grade {4}
  end
end