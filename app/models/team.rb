class Team < ActiveRecord::Base
  
  has_and_belongs_to_many :users, before_add: :team_limit

  has_many :invites
  has_and_belongs_to_many :tournaments
  
  private

  def team_limit user
    if self.users.count >= 10
      errors.add :user, _('This team has too many players, maximum: 10')
      raise ActiveRecord::Rollback
    end
  end

end
