# frozen_string_literal: true

# == Schema Information
#
# Table name: copies
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Copy < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  def self.about
    find_by_name 'About'
  end
  
  def self.contacts
    find_by_name 'Contacts'
  end
end
