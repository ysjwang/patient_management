# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    description { Faker::Lorem.paragraph }
    email { Faker::Internet.email }

    birthday { Time.at(Time.now.to_f / 2 + 60*60*24*365*rand(1..20)) }
    gender { ['M', 'F'].sample }

    password { 'password' }
    password_confirmation { 'password' }
    
  end
end
