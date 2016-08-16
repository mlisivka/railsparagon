require "administrate/base_dashboard"

class InviteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    team: Field::BelongsTo,
    sender: Field::BelongsTo.with_options(class_name: "User"),
    recipient: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    accepted: Field::Boolean,
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
    :team,
    :sender,
    :recipient,
    :created_at,
    :accepted,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :team,
    :sender,
    :recipient,
    :id,
    :accepted,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :team,
    :sender,
    :recipient,
  ].freeze

  # Overwrite this method to customize how invites are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(invite)
  #   "Invite ##{invite.id}"
  # end
end
