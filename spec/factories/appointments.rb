# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do

    # You can do cool stuff in your code like
    # FactoryGirl.create(:appointment, :with_doctor, :past_appointment, patient_id: 12)

    notes { Faker::Lorem.paragraph }

    trait :with_doctor do
      doctor { create(:doctor) }
    end

    trait :with_patient do
      patient { create(:patient) }
    end

    trait :past_appointment do
      week_ago = Time.now.to_f - (60 * 60 * 24 * 7).to_f
      # rand_day_adjuster = (60 * 60 * 24 * Random.rand(1..5)).to_f
      # rand_hour_adjuster = (60 * 60 * Random.rand(1..20)).to_f
      # end_time { Time.at(week_ago - rand_day_adjuster - rand_hour_adjuster + 3600) } # Hour long appointment
      # ^^^^^ For some reason this won't work. Putting a rand() isn't a local variable wont' work, and doing Random.rand in a local variable for some reason keeps it persistent along  multiple generations.
      # Note to self: should look into how FactoryGirl handles these inside their { } and traits. Sounds almost like traits are precompiled.

      start_time { Time.at(week_ago - 
        (60 * 60 * 24 * rand(1..5)) - 
        (60 * 60 * rand(1..20))) }
      end_time { Time.at(week_ago - 
        (60 * 60 * 24 * rand(1..5)) - 
        (60 * 60 * rand(1..20)) + 3600) }
    end

    trait :ongoing_appointment do
      start_time { Time.at(Time.now.to_f - 1800) } # Started 30 minutes ago
      end_time { Time.at(Time.now.to_f + 1800) } # Ends in 30 minutes
    end

    trait :future_appointment do
      week_ahead = Time.now.to_f + (60 * 60 * 24 * 7)
      # rand_day_adjuster = 60 * 60 * 24 * Random.rand(1..5)
      # rand_hour_adjuster = 60 * 60 * Random.rand(1..20)
      start_time { Time.at(week_ahead + 
        (60 * 60 * 24 * rand(1..5)) + 
        (60 * 60 * rand(1..20))) }
      end_time { Time.at(week_ahead + 
        (60 * 60 * 24 * rand(1..5)) + 
        (60 * 60 * rand(1..20)) + 3600) }
    end

    trait :with_works do
      after(:create) do |appointment|
        Random.rand(2..4).times do
          appointment.works << build(:work, appointment: appointment)
        end
      end
    end


    factory :valid_ongoing_appointment,   traits: [:with_doctor, :with_patient, :ongoing_appointment]
    factory :valid_past_appointment,      traits: [:with_doctor, :with_patient, :past_appointment]
    factory :valid_future_appointment,    traits: [:with_doctor, :with_patient, :future_appointment]

  end


end