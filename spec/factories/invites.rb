FactoryGirl.define do
  factory :invite do
    association :team
    association :sender, factory: :user
    association :recipient, factory: :user
  end
end