# == Schema Information
#
# Table name: worktypes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  billing_unit :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  rate         :decimal(8, 2)
#

class Worktype < ActiveRecord::Base
  validates :name, presence: true
  validates :billing_unit, presence: true
  validates :rate, presence: true
  has_many :works
end
