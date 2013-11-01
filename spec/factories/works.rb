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

    billable { true }

    notes { Faker::Company.catch_phrase }

   
    trait :with_ongoing_appointment do
      appointment { create(:ongoing_appointment) }
    end

    trait :with_past_appointment do
      appointment { create(:past_appointment) }
    end

    trait :with_future_appointment do
      appointment { create(:future_appointment) }
    end

    trait :unbillable do
      billable { false }
    end

  end
end
