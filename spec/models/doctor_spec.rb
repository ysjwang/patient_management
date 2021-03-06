# == Schema Information
#
# Table name: doctors
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

describe Doctor do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    it 'is valid with a first name, last name, and description' do
      doctor = build(:doctor, first_name: 'John', last_name: 'Smith', description: 'Hello!')
      expect(doctor).to be_valid
    end

    it 'is not valid wihout a first name' do
      doctor = build(:doctor, first_name: nil)
      expect(doctor).to have_at_least(1).errors_on(:first_name)
    end

    it 'is not valid without a last name' do
      doctor = build(:doctor, last_name: nil)
      expect(doctor).to have_at_least(1).errors_on(:last_name)
    end

    it 'is valid without a description' do
      doctor = build(:doctor, description: nil)
      expect(doctor).to be_valid
    end
    
  end
end
