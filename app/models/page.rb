class Page < ApplicationRecord
  validates :name, :path, presence: true, uniqueness: true

  scope :navbar, -> { where navbar: true }
end
