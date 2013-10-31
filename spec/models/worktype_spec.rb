# == Schema Information
#
# Table name: worktypes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  billing_unit :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  rate         :decimal(8, 2)
#

require 'spec_helper'

describe Worktype do
  describe 'validations' do
    it 'is valid with a name, billing unit, and rate' do
      worktype = build(:worktype,
        name: 'Running',
        billing_unit: 'hourly',
        rate: 10)
      expect(worktype).to be_valid
    end

    it 'is not valid without a name' do
      worktype = build(:worktype, name: nil)
      expect(worktype).to have_at_least(1).errors_on(:name)
    end

    it 'is not valid without a billing unit' do
      worktype = build(:worktype, billing_unit: nil)
      expect(worktype).to have_at_least(1).errors_on(:billing_unit)
    end

    it 'is not valid without a rate' do
      worktype = build(:worktype, rate: nil)
      expect(worktype).to have_at_least(1).errors_on(:rate)
    end
  end


end
