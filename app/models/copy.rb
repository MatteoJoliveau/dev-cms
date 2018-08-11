# frozen_string_literal: true

class Copy < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  def self.about
    find_by_name 'About'
  end
  
  def self.contacts
    find_by_name 'Contacts'
  end
end
