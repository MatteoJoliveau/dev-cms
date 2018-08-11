# frozen_string_literal: true

class Admin < ApplicationRecord
  include Clearance::User

  validates :email, presence: true, uniqueness: true
end
