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
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    it 'is valid with a worktype, appointment, and quantity'
    it 'is invalid without a worktype'
    it 'is invalid without an appointment'
    it 'is invalid without a quantity'

  end


end
