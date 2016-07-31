class Tournament < ActiveRecord::Base
  
  has_and_belongs_to_many :teams, before_add: [:team_limit, :team_dublicate]
  
  def team_limit team # Максимальна кількість команд на цьому турнірі досягнута
    if self.teams.size >= self.max_team
      self.errors.add(:team, _('The maximum number of teams in the tournament reached'))
      raise ActiveRecord::Rollback
    end
  end
  
  def team_dublicate team # Ця команда вже була зареєстрвана на цей турнір
    if self.teams.include?(team)
      self.errors.add(:team, _('This team has already been registered on this tournament'))
      raise ActiveRecord::Rollback
    end
  end
  
  
end
