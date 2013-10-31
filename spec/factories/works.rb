# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work do
    quantity "9.99"
    worktype_id 1
    appointment_id 1
  end
end
