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
#

class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders history]

  has_one_attached :image

  validates :company_name, :position, :short_description, :starting_date, presence: true

  private

  def slug_candidates
    [
      %i[company_name position]
    ]
  end
end
