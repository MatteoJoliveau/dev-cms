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
#

class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders]

  has_one_attached :image

  scope :starred, -> { where(star: true) }
end
