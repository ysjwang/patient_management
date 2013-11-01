# Read about factories at https://github.com/thoughtbot/factory_girl

# == Schema Information
#
# Table name: worktypes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  billing_unit :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  rate         :decimal(8, 2)
#


FactoryGirl.define do
  factory :worktype do
    name { Faker::Commerce.product_name } 
    billing_unit { ['hours', 'counts', 'one-time'].sample }
    rate { rand(1..100) }
  end
end
