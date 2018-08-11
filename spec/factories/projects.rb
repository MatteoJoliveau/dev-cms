# frozen_string_literal: true

# == Schema Information
#
# Table name: projects
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  slug        :string           not null
#  url         :string
#  website     :string
#  description :text
#  star        :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  published   :boolean          default(FALSE)
#


FactoryBot.define do
  factory :project do
    name { Faker::Fallout.character }
    url { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
    star { (rand % 2).zero? }
  end
end
