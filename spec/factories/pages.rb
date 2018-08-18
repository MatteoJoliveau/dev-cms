FactoryBot.define do
  factory :page do
    name { Faker::Internet.username }
    path { "/#{Faker::Internet.domain_word}" }
    content { Faker::Lorem.paragraph 5 }
    navbar_order { rand(1...10) }
  end
end
