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
    it 'is valid with a worktype, appointment, billable, and quantity'
    it 'is invalid without a worktype'
    it 'is invalid without an appointment'
    it 'is invalid without a quantity'
    it 'is invalid without billable'

  end

  describe 'billing' do
    it 'outputs 0 billable if work is not billable'
    it 'correctly calculates billable work'
  end

end
