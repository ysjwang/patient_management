# == Schema Information
#
# Table name: works
#
#  id             :integer          not null, primary key
#  quantity       :decimal(8, 2)
#  worktype_id    :integer
#  appointment_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  billable       :boolean
#

require 'spec_helper'

describe Work do

  describe 'validations' do
    it 'is valid with a worktype, appointment, billable, and quantity' do
      
      work = build(:work, 
        worktype: create(:worktype),
        appointment: create(:valid_ongoing_appointment),
        billable: true,
        quantity: 10)

      expect(work).to be_valid
    end

    it 'is invalid without a worktype' do
      work = build(:work, worktype: nil)
      expect(work).to have_at_least(1).errors_on(:worktype_id)
    end

    it 'is invalid without an appointment' do
      work = build(:work, appointment: nil)
      expect(work).to have_at_least(1).errors_on(:appointment_id)
    end

    it 'is invalid without a quantity' do
      work = build(:work, quantity: nil)
      expect(work).to have_at_least(1).errors_on(:quantity)
    end

    it 'is invalid without billable' do
      work = build(:work, billable: nil)
      expect(work).to have_at_least(1).errors_on(:billable)
    end

  end

  describe 'billing' do
    it 'outputs 0 billable if work is not billable' do
      work = build(:work, :unbillable)
      expect(work.billable_amount).to eq 0
    end

    it 'correctly calculates billable work' do
      worktype = build(:worktype, rate: 10)
      work = build(:work, worktype: worktype, quantity: 5)
      expect(work.billable_amount.to_s).to eq '50.0'

    end
  end

end
