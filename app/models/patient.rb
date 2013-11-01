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
#  gender                 :string(255)
#  birthday               :datetime
#

class Patient < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  has_many :appointments
  has_many :doctors, through: :appointments

  def full_name
    return self.first_name + ' ' + self.last_name
  end

  def reverse_full_name
    return self.last_name + ' ' + self.first_name
  end

  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - (self.birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

end
