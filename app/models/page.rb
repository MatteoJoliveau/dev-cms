# frozen_string_literal: true

class Page < ApplicationRecord
  validates :name, :path, presence: true, uniqueness: true

  scope :navbar, -> { where(navbar: true).order(navbar_order: :desc) }

  before_validation do
    update_attribute(:navbar_order, 1) if navbar && navbar_order.zero?
  end
end
