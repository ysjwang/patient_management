# == Schema Information
#
# Table name: appointments
#
#  id                      :integer          not null, primary key
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
      doctor = FactoryGirl.create(:doctor)
      patient = FactoryGirl.create(:patient)

      previous_appointment = FactoryGirl.create(:past_appointment)
      next_appointment = FactoryGirl.create(:future_appointment)

      # Note we had to add 'my_' to each definition above.

      appointment = FactoryGirl.build(:appointment, 
        start_time: Time.now, 
        end_time: Time.at(Time.now.to_f + 3600),
        doctor: doctor,
        patient: patient,
        previous_appointment: previous_appointment,
        next_appointment: next_appointment)

      expect(appointment).to be_valid


    end


    it 'is invalid without a start_time' do
      appointment = build(:ongoing_appointment, start_time: nil)
      expect(appointment).to have_at_least(1).errors_on(:start_time)
    end

    it 'is invalid without an end_time' do
      appointment = build(:ongoing_appointment, end_time: nil)
      expect(appointment).to have_at_least(1).errors_on(:end_time)
    end

    it 'is invalid without a doctor' do
      appointment = build(:ongoing_appointment, doctor: nil)
      expect(appointment).to have_at_least(1).errors_on(:doctor_id)
    end

    it 'is invalid without a patient' do
      appointment = build(:ongoing_appointment, patient: nil)
      expect(appointment).to have_at_least(1).errors_on(:patient_id)
    end


  end

  describe 'relationships' do
    # Doctor:Patient relationships
    before :each do
      @doctor = create(:doctor)
      @patient = create(:patient)
      appointment = create(:ongoing_appointment, doctor: @doctor, patient: @patient)
    end

    it 'connects a doctor to its patients' do
      expect(@doctor.patients).to include @patient
    end


    it 'connects a patient to its doctors' do
      expect(@patient.doctors).to include @doctor
    end

  end

  describe 'add previous/next appointments' do

    before :each do
      @appointment = create(:ongoing_appointment)
      @patient = @appointment.patient
      @past_appointment = create(:past_appointment, patient: @patient)
      @future_appointment = create(:future_appointment, patient: @patient)
    end

    it 'is successful if previous appointment starts before this one' do
      # @appointment.previous_appointment = @past_appointment
      @appointment.set_previous_appointment!(@past_appointment)
      expect(@appointment.previous_appointment).to eq @past_appointment
      # expect(@appointment).to be_valid
    end

    it 'is unsuccessful if previous appointment starts after this one' do
      @appointment.set_previous_appointment!(@future_appointment)
      expect(@appointment.previous_appointment).to_not eq @future_appointment
      # expect(@appointment).to have_at_least(1).errors_on(:previous_appointment_id)
    end

    it 'is successful if next appointment starts after this one' do
      @appointment.set_next_appointment!(@future_appointment)
      expect(@appointment.next_appointment).to eq @future_appointment
    end

    it 'is unsuccessful if next appointment starts before this one' do
      @appointment.set_next_appointment!(@past_appointment)
      expect(@appointment.next_appointment).to_not eq @past_appointment
    end

    it 'changes previous appointment\'s next-appointment to this one when linking' do
      # When I add a previous appointment, I expect the referred-to appointment to update its next-appointment
      @appointment.set_previous_appointment!(@past_appointment)
      expect(@appointment.previous_appointment.next_appointment).to eq @appointment
    end

    it 'changes next appointment\'s previous-appointment to this one when linking' do
      @appointment.set_next_appointment!(@future_appointment)
      expect(@appointment.next_appointment.previous_appointment).to eq @appointment
    end

    # These next two tests may need to adapt
    # BEGIN
    it 'is not successful if previous_appointment already has a next_appointment' do
      @past_appointment.set_next_appointment!(@future_appointment)
      @appointment.set_previous_appointment!(@past_appointment)
      expect(@appointment.previous_appointment).to_not eq @past_appointment
    end

    it 'is not successful if next_appointment already has a previous_appointment' do
      @future_appointment.set_previous_appointment!(@past_appointment)
      @appointment.set_next_appointment!(@future_appointment)
      expect(@appointment.next_appointment).to_not eq @future_appointment
    end
    # END


    it 'is does not add a previous appointment with a different patient' do
      other_patient = create(:patient)
      @past_appointment.patient = other_patient
      @past_appointment.save

      @appointment.set_previous_appointment!(@past_appointment)
      expect(@appointment.previous_appointment).to_not eq @past_appointment
    end


    it 'is does not add a future appointment with a different patient' do
      other_patient = create(:patient)
      @future_appointment.patient = other_patient
      @future_appointment.save

      @appointment.set_previous_appointment!(@future_appointment)
      expect(@appointment.previous_appointment).to_not eq @future_appointment
    end
  end

  describe 'works' do
    it 'calculates the total billable amount' do
      appointment = create(:ongoing_appointment)

      worktype1 = create(:worktype, rate: 10)
      work1 = create(:work, appointment: appointment, worktype: worktype1, quantity: 2)

      worktype2 = create(:worktype, rate: 20)
      work2 = create(:work, appointment: appointment, worktype: worktype2, quantity: 4)

      worktype3 = create(:worktype, rate: 30)
      work3 = create(:work, appointment: appointment, worktype: worktype3, quantity: 6, billable: false)

      correct_billable_amount = 20 + 80

      expect(appointment.total_billable_amount.to_s).to eq '100.0'


    end
  end

end
