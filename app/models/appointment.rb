class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient

  has_one :previous_appointment, class_name: 'Appointment', foreign_key: 'previous_appointment_id'
  belongs_to :appointment, foreign_key: 'previous_appointment_id'


  has_one :next_appointment, class_name: 'Appointment', foreign_key: 'next_appointment_id'
  belongs_to :appointment, foreign_key: 'next_appointment_id'
end
