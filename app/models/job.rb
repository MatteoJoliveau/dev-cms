# frozen_string_literal: true
# == Schema Information
#
# Table name: jobs
#
#  id                :bigint(8)        not null, primary key
#  company_name      :string           not null
#  position          :string           not null
#  description       :text
#  slug              :string           not null
#  starting_date     :date             not null
#  ending_date       :date
#  url               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string           not null
#  published         :boolean          default(FALSE)
#

class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders history]

  has_one_attached :image

  scope :published, -> { where(published: true) }
  scope :order_recent, -> { order(starting_date: :asc) }

  validates :company_name, :position, :short_description, :starting_date, presence: true

  def self.current
    find_by ending_date: nil
  end

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

  def slug_candidates
    [
      %i[company_name position]
    ]
  end
end
