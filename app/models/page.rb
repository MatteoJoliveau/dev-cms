class Page < ApplicationRecord
  validates :name, :path, presence: true, uniqueness: true
end
