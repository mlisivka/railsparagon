class User < ActiveRecord::Base

  has_many :posts
  has_and_belongs_to_many :teams, before_add: :player_limit

  has_many :invitions,    class_name: "Invite", foreign_key: "recipient_id"
  has_many :send_invites, class_name: "Invite", foreign_key: "sender_id"
  
  validates :name,
    presence: { message: "Must be given please" },
    format: { with: /\A[A-Za-z0-9]{3,16}\z/, message: "Name must be between 3 and 16 characters" },
    uniqueness: { message: "This name is already taken, choose another please" }
  #validates :password, confirmation: true
  
  private

  def player_limit team
    if self.teams.count >= 5
      errors.add :team, "This player has too many teams, maximum: 5"
      raise ActiveRecord::Rollback
    end
  end

end
