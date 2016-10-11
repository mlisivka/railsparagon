class Tournament < ActiveRecord::Base
  
  validates :max_team, numericality: { only_integer: true, greater_than_or_equal_to: 2 }
  
  has_many :teams, through: :players
  has_many :players
  has_many :matches
  
end
