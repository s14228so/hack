FactoryBot.define do
  factory :profile do
    user { nil }
    carrier { "MyText" }
    skill { "MyText" }
    license { "MyText" }
    appear { "MyText" }
    status { 1 }
    twitter { "MyText" }
  end
end
