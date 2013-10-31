# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create some Doctors
10.times do |number|
  create(:doctor, email: 'doctor' + number + '@email.com')
end


# Create some more Patients
50.times do |number|
  create(:patient, email: 'patient' + number + '@email.com')
end


# Create some Worktypes
10.times do |number|
  create(:worktype)
end

# Create some appointments
Patient.all.each do
  appointment_count = rand(1..4)
  appointment_count.each do 

  end



end