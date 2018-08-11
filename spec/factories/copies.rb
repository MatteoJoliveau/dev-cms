FactoryBot.define do
  factory :copy do
    name { Faker::Fallout.character }
    content { Faker::Lorem.paragraph }

    trait :about do
      name { 'About' }
      end

    trait :contacts do
      name { 'Contacts' }
    end
  end
end
