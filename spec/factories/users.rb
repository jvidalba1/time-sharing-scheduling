FactoryGirl.define do
  factory :user do
    email "newuser@example.com"
    confirmed false

    factory :confirmed do
      confirmed true
    end
  end
end