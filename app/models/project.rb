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

class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders history]

  has_one_attached :image

  scope :starred, -> { where(star: true) }
  scope :published, -> { where(published: true) }

  validates_presence_of :name

  def published?
    published
  end

  def publish
    update_attribute :published, true
  end

  def unpublish
    update_attribute :published, false
  end

  private

  def should_generate_new_friendly_id?
    name_changed?
  end
end
