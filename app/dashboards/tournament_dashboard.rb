require "administrate/base_dashboard"

class TournamentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    teams: Field::HasMany,
    matches: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    max_team: Field::Number,
    payment: Field::Number,
    prize_pool: Field::Number,
    description: CkeditorField,
    end: Field::Boolean,
    tournament_begins: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :max_team,
    :teams,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :teams,
    :matches,
    :users,
    :id,
    :title,
    :max_team,
    :payment,
    :prize_pool,
    :end,
    :tournament_begins,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :max_team,
    :payment,
    :prize_pool,
    :description,
    :end,
    :tournament_begins,
  ].freeze

  # Overwrite this method to customize how tournaments are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(tournament)
    "#{tournament.title}"
  end
end