# == Schema Information
#
# Table name: admins
#
#  id                 :bigint(8)        not null, primary key
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
