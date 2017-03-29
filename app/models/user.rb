class User < ApplicationRecord

  has_many :invitions,    class_name: "Invite", foreign_key: "recipient_id"
  has_many :send_invites, class_name: "Invite", foreign_key: "sender_id"
  has_and_belongs_to_many :tournaments
  has_and_belongs_to_many :teams, before_add: :player_limit

  after_update :check_email

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

  def check_email
    if self.email.empty? && self.email_changed?
      self.errors.add :email, _('Please enter your email')
      raise ActiveRecord::Rollback
    end
  end

end
