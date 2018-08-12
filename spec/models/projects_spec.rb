require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validations' do
    it { is_expected.to have(1).error_on :name }
    it { is_expected.to have(1).error_on :image }

    it 'is valid' do
      expect(build(:project)).to be_valid
    end
  end
end