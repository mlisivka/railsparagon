class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teams, before_add: :player_limit

  has_many :invitions,    class_name: "Invite", foreign_key: "recipient_id"
  has_many :send_invites, class_name: "Invite", foreign_key: "sender_id"

  validates :name,
    presence: { message: _('Field can not be empty') },
    format: { with: /\A[A-Za-z0-9]{3,16}\z/, message: _('Name must be between 3 and 16 characters') },
    uniqueness: { case_sensitive: false, message: _('This name is already taken, choose another please') }
  validates_uniqueness_of :email
  validates :password, confirmation: true

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
