# frozen_string_literal: true

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


require 'rails_helper'

RSpec.describe Config, type: :model do
  context 'validations' do
    it { is_expected.to have(1).error_on :key }
    it { is_expected.to have(1).error_on :value }
  end

  context '.fetch' do
    let(:config) { create :config }
    let(:default) { 'default' }
    subject do
      described_class.fetch('inexistent') { default }
    end

    it 'fetches a config key-value pair' do
      key = config.key
      expect(described_class.fetch(key)).to eq config.value
    end

    it 'returns a default value if none is found' do
      is_expected.to eq default
    end
  end
end
