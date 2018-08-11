# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::Fallout.character }
    url { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
    star { (rand % 2).zero? }
  end
end
