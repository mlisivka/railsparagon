class Match < ApplicationRecord

  has_and_belongs_to_many :teams
  belongs_to :tournament

end
