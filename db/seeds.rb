# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create some Doctors
10.times do |number|
  FactoryGirl.create(:doctor, email: 'doctor' + number.to_s + '@email.com')
end


# Create some more Patients
50.times do |number|
  FactoryGirl.create(:patient, email: 'patient' + number.to_s + '@email.com')
end


# Create some Worktypes
10.times do |number|
  FactoryGirl.create(:worktype)
end

# Create some appointments
Patient.all.each do |patient|
  appointment_count = rand(1..4)
  appointment_count.times do 
    # For each of these appointments

    # Randomize if past, present, or future (bias it towards past or ongoing)
    appointment_type = [:valid_past_appointment, :valid_past_appointment, :valid_past_appointment, :valid_ongoing_appointment, :valid_ongoing_appointment, :valid_future_appointment].sample
    appointment = FactoryGirl.create(appointment_type, patient: patient, doctor: Doctor.all.sample)
    rand(1..3).times do
      appointment.works << FactoryGirl.create(:work, appointment: appointment, worktype: Worktype.all.sample)
    end

  end



end