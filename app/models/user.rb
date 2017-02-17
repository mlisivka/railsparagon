class User < ActiveRecord::Base

  has_many :invitions,    class_name: "Invite", foreign_key: "recipient_id"
  has_many :send_invites, class_name: "Invite", foreign_key: "sender_id"
  has_and_belongs_to_many :tournaments
  has_and_belongs_to_many :teams, before_add: :player_limit
  
  # In order to visit user page via name
  def to_param
    name
  end

  private

  def player_limit team
    if self.teams.size >= 5
      errors.add :team, _('This user has exceeded the limit teams, maximum: 5')
      raise ActiveRecord::Rollback
    end
  end

end
