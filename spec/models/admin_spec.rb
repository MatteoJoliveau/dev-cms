# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'validations' do
    it { is_expected.to have(1).error_on :username }

    it 'is valid' do
      expect(build(:admin)).to be_valid
    end
  end
end
