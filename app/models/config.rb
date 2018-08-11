# == Schema Information
#
# Table name: configs
#
#  id         :bigint(8)        not null, primary key
#  key        :string           not null
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Config < ApplicationRecord
  validates_presence_of :key, :value
  validates_uniqueness_of :key

  def self.fetch key
    find_by_key(key)&.value || (block_given? ? yield : nil)
  end
end
