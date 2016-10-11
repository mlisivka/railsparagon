class Player < ActiveRecord::Base
  
  belongs_to :team
  belongs_to :tournament
  
  validates :players_id, presence: { message: _("Please select the players who will play in this tournament") }
  validate :team_dublicate, :team_limit, :registered_player, on: :create, if: Proc.new { |a| a.errors.empty? }
  
  def registered_player # гравець "name" вже належить до зареєстрованих команд. Будь ласка змініть склад команди
    self.tournament.teams.each do |tournament_teams|
      tournament_teams.users.each do |team_users|
        if self.players_id == team_users.id
          errors.add(:team, _('Player "%{name}" already belongs to the registered teams. Please change team staff') % {name: team_users.name})
        end
      end
    end
  end
  
  def team_limit # Максимальна кількість команд в цьому турнірі досягнута
    if self.tournament.teams.size >= self.tournament.max_team
      errors.add(:team, _('The maximum number of teams in the tournament reached'))
    end
  end
  
  def team_dublicate # Ця команда вже була зареєстрована на цьому турнірі
    if self.tournament.teams.include?(self.team)
      errors.add(:team, _('This team has already been registered on this tournament'))
    end
  end
  
end
