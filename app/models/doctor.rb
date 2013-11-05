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

class Doctor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :description, presence: true

  has_many :appointments
  has_many :patients, through: :appointments

  after_create :give_appointments

  def full_name
    return self.first_name + ' ' + self.last_name
  end

  def doctor_name_full
    return 'Dr. ' + self.full_name
  end

  def doctor_name
    return 'Dr. ' + self.last_name
  end

  def give_appointments
    # Temporary: give a new doctor sign up some patients and appointments

    appointment_count = 10
    appointment_count.times do 
      # For each of these appointments

      # Randomize if past, present, or future (bias it towards past or ongoing)
      appointment_type = [:valid_past_appointment, :valid_past_appointment, :valid_past_appointment, :valid_ongoing_appointment, :valid_ongoing_appointment, :valid_future_appointment].sample
      appointment = FactoryGirl.create(appointment_type, patient: Patient.all.sample, doctor: self)
      rand(1..3).times do
        appointment.works << FactoryGirl.create(:work, appointment: appointment, worktype: Worktype.all.sample)
      end

    end


  end


end
