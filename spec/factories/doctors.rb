# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :doctor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    description { Faker::Lorem.paragraph }
    email { Faker::Internet.email }

    password { 'password' }
    password_confirmation { 'password' }
    
    # hello_user = create(:patient)

  end
end
