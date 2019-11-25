FactoryBot.define do
  factory :offer do
    title { Faker::Hipster.sentence(word_count: 3) }
    description { Faker::Hipster.sentence(word_count: 3, supplemental: true) }
    price { Faker::Number.decimal }
  end
end
