FactoryGirl.define do
  factory :team do
    sequence(:full_name) { |i| "TeamName#{i}" }
    captain_id 1
  end
end