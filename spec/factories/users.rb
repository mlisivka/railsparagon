FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "username#{i}" }
    sequence(:email) { |i| "email#{i}@email.com" }
    password "VeryGood"
  end
end