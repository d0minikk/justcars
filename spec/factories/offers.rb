FactoryBot.define do
  factory :offer do
    title { Faker::Hipster.sentence }
    description { Faker::Hipster.sentence }
    price { Faker::Number.decimal }
  end
end
