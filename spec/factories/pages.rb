FactoryBot.define do
  factory :page do
    name { Faker::Internet.username }
    path { "/#{Faker::Internet.domain_word}" }
    content { Faker::Lorem.paragraph 5 }
  end
end
