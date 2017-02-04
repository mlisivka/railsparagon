class Tournament < ActiveRecord::Base
  
  validates :max_team, numericality: { only_integer: true, greater_than_or_equal_to: 2 }

  has_many :matches
  has_and_belongs_to_many :teams, before_add: [:team_limit, :team_dublicate]
  has_and_belongs_to_many :users, before_add: :registered_player
  
  def team_limit team # Максимальна кількість команд в цьому турнірі досягнута
    if self.teams.size >= self.max_team
      self.errors.add(:team, _('The maximum number of teams in the tournament reached'))
      raise ActiveRecord::Rollback
    end
  end
  
  def team_dublicate team # Ця команда вже була зареєстрована на цьому турнірі
    if self.teams.include?(team)
      self.errors.add(:team, _('This team has already been registered on this tournament'))
      raise ActiveRecord::Rollback
    end
  end
  
  def registered_player user # гравець "name" вже належить до зареєстрованих команд. Будь ласка змініть склад команди
    if self.users.include?(user)
      self.errors.add(:team, _('Player "%{name}" already belongs to the registered teams. Please change team staff') % {name: user.name})
      raise ActiveRecord::Rollback
    end
  end
  
end
