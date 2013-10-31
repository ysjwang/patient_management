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
    it 'is valid with a name, billing unit, and rate'
    it 'is not valid without a name'
    it 'is not valid without a billing unit'
    it 'is not valid without a rate'

  end


end
