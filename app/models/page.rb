# frozen_string_literal: true

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


class Page < ApplicationRecord
  validates :name, :path, presence: true, uniqueness: true

  scope :navbar, -> { where(navbar: true).order(navbar_order: :desc) }
  scope :published, -> { all }

  before_validation do
    self.path = path.sub(/^\/*/, '') if path.present?
    self.navbar_order = 1 if navbar && navbar_order&.zero?
  end
end
