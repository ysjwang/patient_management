# == Schema Information
#
# Table name: patients
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  description            :text
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe Patient do
  context 'validations' do
    it 'is valid with a first name, last name, and description' do
      patient = build(:patient, first_name: 'John', last_name: 'Smith', description: 'Hello!')
      expect(patient).to be_valid
    end

    it 'is not valid wihout a first name' do
      patient = build(:patient, first_name: nil)
      expect(patient).to have_at_least(1).errors_on(:first_name)
    end

    it 'is not valid without a last name' do
      patient = build(:patient, last_name: nil)
      expect(patient).to have_at_least(1).errors_on(:last_name)
    end

    it 'is not valid without a description' do
      patient = build(:patient, description: nil)
      expect(patient).to have_at_least(1).errors_on(:description)
    end
    
  end
end
