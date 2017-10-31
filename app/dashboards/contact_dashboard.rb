require "administrate/base_dashboard"

class ContactDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    phone_numbers: Field::HasMany,
    addresses: Field::HasMany,
    user: Field::BelongsTo,
    id: Field::Number,
    first_name: Field::String,
    middle_name: Field::String,
    last_name: Field::String,
    email: Field::String,
    phone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :phone_numbers,
    :addresses,
    :user,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :phone_numbers,
    :addresses,
    :user,
    :id,
    :first_name,
    :middle_name,
    :last_name,
    :email,
    :phone,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :phone_numbers,
    :addresses,
    :user,
    :first_name,
    :middle_name,
    :last_name,
    :email,
    :phone,
  ].freeze

  # Overwrite this method to customize how contacts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(contact)
  #   "Contact ##{contact.id}"
  # end
end
