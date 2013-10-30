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

class Appointment < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :doctor
  belongs_to :patient

  has_one :previous_appointment, class_name: 'Appointment'
  belongs_to :appointment, foreign_key: 'previous_appointment_id'


  has_one :next_appointment, class_name: 'Appointment'
  belongs_to :appointment, foreign_key: 'next_appointment_id'



end
