class Team < ActiveRecord::Base
  
  has_and_belongs_to_many :users, before_add: :team_limit

  has_many :invites
  has_and_belongs_to_many :tournaments
  
  private

  def team_limit user
    if user.teams.count >= 5
      errors.add :user, "This player has too many teams, maximum: 5"
      raise ActiveRecord::Rollback
    end
  end

end
