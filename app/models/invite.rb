class Invite < ActiveRecord::Base

  belongs_to :team
  belongs_to :sender,    class_name: "User"
  belongs_to :recipient, class_name: "User"
  
  validate on: :create do |invite|
    invite.already_received
    invite.send_yourself
    invite.already_member
  end
  
  def send_yourself # Відправник не може бути одержувачем
    if self.sender == self.recipient
      errors.add(:recipient, _('Sender not must be recipient'))
    end
  end
  
  def already_member # Цей користувач вже є учасником цієї команди
    self.team.users.map do |player_of_the_this_team|
      self.errors.add(:user, _('This user is already a member of this team')) if player_of_the_this_team == self.recipient
    end
  end
  
  def already_received # Цей користувач вже отримав запрошення в цю команду
    self.team.invites.map do |i|
      self.errors.add(:user, _('This user has already received an invitation to this team')) if i.accepted.nil? && i.recipient == self.recipient
    end
  end

end
