class Team < ApplicationRecord

  has_and_belongs_to_many :users, before_add: :team_limit
  has_and_belongs_to_many :matches
  has_many                :invites
  has_many                :tournaments

  validates :full_name,
    presence: { message: _('Field can not be empty') },
    uniqueness: { message: _('This team name is already taken, choose another please') }
  validates :tag_name,
    uniqueness: { allow_blank: true, message: _('This abbreviation is already taken, choose another please') }

  private

  def team_limit user
    if self.users.size >= 5
      errors.add :user, _('This team has too many players, maximum: 5')
      raise ActiveRecord::Rollback
    end
  end

end
