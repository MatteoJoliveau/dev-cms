# == Schema Information
#
# Table name: configs
#
#  id         :bigint(8)        not null, primary key
#  key        :string           not null
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :config do
    key { Faker::Lorem.word }
    value { Faker::LordOfTheRings.character }
  end
end
