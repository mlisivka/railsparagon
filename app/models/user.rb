class User < ActiveRecord::Base

  has_many :posts
  has_and_belongs_to_many :teams

  has_many :invitions,    class_name: "Invite", foreign_key: "recipient_id"
  has_many :send_invites, class_name: "Invite", foreign_key: "sender_id"

end
