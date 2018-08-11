# frozen_string_literal: true
# == Schema Information
#
# Table name: jobs
#
#  id                :bigint(8)        not null, primary key
#  company_name      :string           not null
#  position          :string           not null
#  description       :text
#  slug              :string           not null
#  starting_date     :date             not null
#  ending_date       :date
#  url               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string           not null
#

require 'rails_helper'

RSpec.describe Job, type: :model do
  context 'validations' do
    it { is_expected.to have(1).error_on :company_name }
    it { is_expected.to have(1).error_on :position }
    it { is_expected.to have(1).error_on :starting_date }
    it { is_expected.to have(1).error_on :short_description }

    it 'is valid' do
      expect(build(:job)).to be_valid
    end
  end
end
