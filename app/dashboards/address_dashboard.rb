require "administrate/base_dashboard"

class AddressDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    contactable: Field::Polymorphic,
    id: Field::Number,
    address_type: Field::String,
    primary: Field::Boolean,
    street1: Field::Text,
    street2: Field::Text,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    country: Field::String,
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
    :street1,
    :street2,
    :city,
    :state,
    :zip,
    :country,
    :address_type,
    :primary,
    :contactable,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :contactable,
    :id,
    :address_type,
    :primary,
    :street1,
    :street2,
    :city,
    :state,
    :zip,
    :country,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :contactable,
    :address_type,
    :primary,
    :street1,
    :street2,
    :city,
    :state,
    :zip,
    :country,
  ].freeze

  # Overwrite this method to customize how addresses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(address)
  #   "Address ##{address.id}"
  # end
end
