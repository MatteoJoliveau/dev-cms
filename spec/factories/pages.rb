# == Schema Information
#
# Table name: pages
#
#  id           :bigint(8)        not null, primary key
#  name         :string           not null
#  path         :string           not null
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  navbar       :boolean          default(FALSE)
#  navbar_order :integer          default(0)
#

FactoryBot.define do
  factory :page do
    name { Faker::Internet.username }
    path { "/#{Faker::Internet.domain_word}" }
    content { Faker::Lorem.paragraph 5 }
    navbar_order { rand(1...10) }
  end
end
