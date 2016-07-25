class Invite < ActiveRecord::Base

  belongs_to :team
  belongs_to :sender,    class_name: "User"
  belongs_to :recipient, class_name: "User"
  
  validate do |invite|
    invite.already_received
    invite.send_self
    invite.already_member
  end
  
  def send_self # Відправник не може бути одержувачем
    if self.sender == self.recipient
      errors.add(:recipient, _('Sender not must be recipient'))
    end
  end
  
  def already_member # Цей користувач вже є учасником цієї команди
    self.team.users.map do |i|
      self.errors.add(:user, _('This user is already a member of this team')) if i == self.recipient
    end
  end
  
  def already_received # Цей користувач вже отримав запрошення в цю команду
    self.team.invites.map do |i|
      self.errors.add(:user, _('This user has already received an invitation to this team')) if i.accepted.nil? && i.recipient == self.recipient
    end
  end

end
