FactoryGirl.define do
  factory :team do
    sequence(:full_name) { |i| "TeamName#{i}" }
  end
end
