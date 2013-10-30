# == Schema Information
#
# Table name: appointments
#
#  id                      :integer          not null, primary key
#  email                   :string(255)      default(""), not null
#  encrypted_password      :string(255)      default(""), not null
#  reset_password_token    :string(255)
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :string(255)
#  last_sign_in_ip         :string(255)
#  start_time              :datetime
#  end_time                :datetime
#  doctor_id               :integer
#  patient_id              :integer
#  previous_appointment_id :integer
#  next_appointment_id     :integer
#  created_at              :datetime
#  updated_at              :datetime
#

require 'spec_helper'

describe Appointment do
    describe 'validations' do
    it 'is valid with a start_time, end_time, doctor_id, patient_id, notes, previous appointment, next appointment' do

    end
    it 'is invalid without a start_time'
    it 'is invalid without an end_time'
    it 'is invalid without a doctor'
    it 'is invalid without a patient'
  end

  describe 'relationships' do
    # Doctor:Patient relationships
    it 'connects a doctor to its patients'
    it 'connects a patient to its doctors'

  end

  describe 'add previous/next appointments' do
    it 'changes previous appointment\s next-appointment to this one when linking'
    it 'changes next appointment\'s previous-appointment to this one when linking'
  end
end
