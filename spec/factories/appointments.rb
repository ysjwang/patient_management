# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do


    factory :with_doctor_patient do

      doctor { create(:doctor) }
      patient { create(:patient) }

      factory :past_appointment do
        start_time { Time.at(Time.now.to_f / 2) }
        end_time { Time.at(Time.now.to_f / 2 + 3600) } # Hour long appointment
      end

      factory :future_appointment do
        start_time { Time.at(Time.now.to_f * 2) }
        end_time { Time.at(Time.now.to_f * 2 + 3600) } # Hour long appointment
      end

      factory :ongoing_appointment do
        start_time { Time.at(Time.now.to_f - 1800) } # Started 30 minutes ago
        end_time { Time.at(Time.now.to_f + 1800) } # Ends in 30 minutes
      end

    end

  end
end
