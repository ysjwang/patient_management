# == Schema Information
#
# Table name: works
#
#  id             :integer          not null, primary key
#  quantity       :decimal(8, 2)
#  worktype_id    :integer
#  appointment_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#  billable       :boolean
#

class Work < ActiveRecord::Base
end
