# == Schema Information
#
# Table name: copies
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
