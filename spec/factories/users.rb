FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    email "newuser@example.com"
    confirmed false
  end
end