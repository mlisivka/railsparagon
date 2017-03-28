FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "username#{i}" }
    sequence(:accountId) { |i| "#{i}" }
  end
end
