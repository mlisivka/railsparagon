require "administrate/base_dashboard"

class TeamDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    users: Field::HasMany,
    invites: Field::HasMany,
    tournaments: Field::HasMany,
    id: Field::Number,
    full_name: Field::String,
    tag_name: Field::String,
    country: Field::String,
    rating: Field::Number,
    image: Field::String,
    captain_id: Field::Number,
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
    :full_name,
    :users,
    :tournaments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :invites,
    :tournaments,
    :id,
    :full_name,
    :tag_name,
    :country,
    :rating,
    :image,
    :captain_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :users,
    :invites,
    :tournaments,
    :full_name,
    :tag_name,
    :country,
    :rating,
    :image,
    :captain_id,
  ].freeze

  # Overwrite this method to customize how teams are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(team)
  #   "Team ##{team.id}"
  # end
end
