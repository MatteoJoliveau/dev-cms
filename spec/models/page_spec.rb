# frozen_string_literal: true

# == Schema Information
#
# Table name: pages
#
#  id           :bigint(8)        not null, primary key
#  name         :string           not null
#  path         :string           not null
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  navbar       :boolean          default(FALSE)
#  navbar_order :integer          default(0)
#


require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validations' do
    let(:page) { create :page }

    it { is_expected.to have(1).error_on :name }
    it { is_expected.to have(1).error_on :path }

    it 'strips initial slash if present' do
      expect(create(:page, path: 'test').path).to eq 'test'
      expect(create(:page, path: '/test2').path).to eq 'test2'
    end

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
