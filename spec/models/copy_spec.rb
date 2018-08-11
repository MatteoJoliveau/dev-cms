# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Copy, type: :model do
  context 'validations' do
    it { is_expected.to have(1).error_on :name }

    it 'is valid' do
      expect(build(:copy)).to be_valid
    end
  end

  context '#about' do
    before { create :copy, :about }

    it 'returns the about copy' do
      expect(described_class.about.name).to eq('About')
    end
  end

  context '#contacts' do
    before { create :copy, :contacts }

    it 'returns the about copy' do
      expect(described_class.contacts.name).to eq('Contacts')
    end
  end
end
