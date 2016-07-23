class User < ActiveRecord::Base

  has_many :posts
  has_and_belongs_to_many :teams, before_add: :player_limit

  has_many :invitions,    class_name: "Invite", foreign_key: "recipient_id"
  has_many :send_invites, class_name: "Invite", foreign_key: "sender_id"
  
  private

  def player_limit team
    if self.teams.count >= 5
      errors.add :team, "This player has too many teams, maximum: 5"
      raise ActiveRecord::Rollback
    end
  end

end
