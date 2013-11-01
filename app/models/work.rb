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
#  notes          :text
#

include ActionView::Helpers::TextHelper # for pluralize in work_done_string()

class Work < ActiveRecord::Base
  validates :worktype_id, presence: true
  validates :appointment_id, presence: true
  validates :worktype_id, presence: true
  validates :quantity, presence: true
  
  # This one needs to be validated in a special way due to the way Rails handles .blank? (false.blank? # => true)
  validates_inclusion_of :billable, :in => [true, false] # validates :billable, presence: true



  belongs_to :appointment
  belongs_to :worktype

  # scope :billable, where(billable: true)


  def billable_amount
    if self.billable
      return self.quantity * self.worktype.rate
    else
      return 0
    end
  end

  def work_done_string
    return pluralize(self.quantity, self.worktype.billing_unit) + ' of ' + self.worktype.name
  end

  def work_quantity_string
    return pluralize(self.quantity, self.worktype.billing_unit)
  end

  def billable?
    return self.billable
  end


end
