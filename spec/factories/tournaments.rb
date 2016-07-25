FactoryGirl.define do
  factory :tournamet do
    title "The International"
    max_team 16
    sequence(:tournament_begins) { |n| Time.now + n.weeks + 1.hour }
  end
end