# Read about factories at https://github.com/thoughtbot/factory_girl

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



FactoryGirl.define do
  factory :work do
    quantity { rand() * 10 }

    worktype { create(:worktype) }
    appointment { create(:ongoing_appointment) }

    billable { true }

    factory :unbillable_work do
      billable { false }
    end

  end
end
