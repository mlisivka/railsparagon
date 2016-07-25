FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "username#{i}" }
  end
end