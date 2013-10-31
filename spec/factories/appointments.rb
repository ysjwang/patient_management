# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do

    # You can do cool stuff in your code like
    # FactoryGirl.create(:appointment, :with_doctor, :past_appointment, patient_id: 12)

    trait :with_doctor do
      doctor { create(:doctor) }
    end

    trait :with_patient do
      patient { create(:patient) }
    end

    trait :past_appointment do
      start_time { Time.at(Time.now.to_f / 2) }
      end_time { Time.at(Time.now.to_f / 2 + 3600) } # Hour long appointment
    end

    trait :ongoing_appointment do
      start_time { Time.at(Time.now.to_f - 1800) } # Started 30 minutes ago
      end_time { Time.at(Time.now.to_f + 1800) } # Ends in 30 minutes
    end

    trait :future_appointment do
      start_time { Time.at(Time.now.to_f * 2) }
      end_time { Time.at(Time.now.to_f * 2 + 3600) } # Hour long appointment
    end

    trait :with_works do
      after(:create) do |appointment|
        rand(2..4).times do
          appointment.works << build(:work, appointment: appointment)
        end
      end
    end


    factory :valid_ongoing_appointment,   traits: [:with_doctor, :with_patient, :ongoing_appointment]
    factory :valid_past_appointment,      traits: [:with_doctor, :with_patient, :past_appointment]
    factory :valid_future_appointment,    traits: [:with_doctor, :with_patient, :future_appointment]

  end


end