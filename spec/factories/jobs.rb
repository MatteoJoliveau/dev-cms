# == Schema Information
#
# Table name: jobs
#
#  id            :bigint(8)        not null, primary key
#  company_name  :string           not null
#  position      :string           not null
#  description   :text
#  slug          :string           not null
#  starting_date :date             not null
#  ending_date   :date
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :job do
    company_name { Faker::Company.name }
    position { Faker::Company.profession }
    description { Faker::Lorem.paragraph 5 }
    starting_date { rand(1...5).years.ago }
    ending_date { 1.years.from_now }
    url { Faker::Internet.url }
  end
end
