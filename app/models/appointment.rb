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

class Appointment < ActiveRecord::Base


  scope :past, lambda { where("end_time < ?", Time.now).order('start_time DESC') }
  scope :ongoing, lambda { where("start_time < ? AND end_time > ?", Time.now, Time.now).order('start_time DESC') }
  scope :future, lambda { where("start_time > ?", Time.now).order('start_time ASC') }

  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true


  belongs_to :doctor
  belongs_to :patient

  has_one :previous_appointment, class_name: 'Appointment', foreign_key: 'previous_appointment_id'
  belongs_to :appointment, foreign_key: 'previous_appointment_id'

  has_one :next_appointment, class_name: 'Appointment', foreign_key: 'next_appointment_id'
  belongs_to :appointment, foreign_key: 'next_appointment_id'

  has_many :works


  def display_start_date
    return start_time.strftime("%A %-d %B, %Y")
  end

  def display_start_time
    return start_time.strftime("%H:%M %p")
  end

  def display_end_time
    return end_time.strftime("%H:%M %p")
  end

  def total_billable_amount
    sum = 0

    self.billable_works.each do |billable_work|
      sum = sum + billable_work.billable_amount
    end

    return sum
  end

  def billable_works
    return self.works.where(billable: true)
  end


  def set_previous_appointment!(previous_appointment)
    return false if previous_appointment.blank?

    # Fre-flight checks:
    # * Whether previous_appointment's next_appointment is blank
    # * Whether previous_appointment takes place before this appointment
    # * Whether previous_appointment's patient and this patient is the same
    if previous_appointment.next_appointment.blank? && 
      previous_appointment.start_time < self.start_time && 
      previous_appointment.patient_id == self.patient_id
      # Passed. Set them
      self.previous_appointment = previous_appointment
      self.save!

      previous_appointment.next_appointment = self
      previous_appointment.save!

      return true
    end
  end

  def set_next_appointment!(next_appointment)
    return false if next_appointment.blank?

    # Fre-flight checks:
    # * Whether next_appointment's previous_appointment is blank
    # * Whether next_appointment takes place before this appointment
    # * Whether next_appointment's patient and this patient is the same
    if next_appointment.previous_appointment.blank? && 
      next_appointment.start_time > self.start_time && 
      next_appointment.patient_id == self.patient_id
      # Passed. Set them
      self.next_appointment = next_appointment
      self.save!

      next_appointment.previous_appointment = self
      next_appointment.save!

      return true
    end
  end

end
