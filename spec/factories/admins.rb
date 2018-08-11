FactoryBot.define do
  factory :admin do
    username { Faker::Internet.username }
  end
end
