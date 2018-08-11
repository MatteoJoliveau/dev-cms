# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                 :bigint(8)        not null, primary key
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'validations' do
    it { is_expected.to have(2).error_on :email }
    it { is_expected.to have(1).error_on :password }

    it 'is valid' do
      expect(build(:admin)).to be_valid
    end
  end
end
