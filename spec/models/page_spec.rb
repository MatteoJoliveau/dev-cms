# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validations' do
    let(:page) { create :page }

    it { is_expected.to have(1).error_on :name }
    it { is_expected.to have(1).error_on :path }

    it 'has order greater than 0 if navbar' do
      page = create(:page, navbar: true, navbar_order: 0)
      expect(page.navbar_order).to eq 1
    end

    it 'is unique by name' do
      expect(build(:page, name: page.name)).to have(1).error_on :name
    end

    it 'is unique by path' do
      expect(build(:page, path: page.path)).to have(1).error_on :path
    end

    it 'is valid' do
      expect(build(:page)).to be_valid
    end
  end
end
