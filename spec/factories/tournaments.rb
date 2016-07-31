FactoryGirl.define do
  factory :tournament do
    sequence(:title) { |i| "The International #{i}" }
    max_team 16
    sequence(:tournament_begins) { |n| Time.now + n.weeks + 1.hour }
  end
end