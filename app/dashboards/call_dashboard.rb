require "administrate/base_dashboard"

class CallDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    parent_id: Field::Number,
    user_id: Field::Number,
    to: Field::String,
    from: Field::String,
    direction: Field::String,
    status: Field::String,
    recording_url: Field::Text,
    recognized_speech: Field::Text,
    recording_duration: Field::Number,
    call_sid: Field::String,
    account_sid: Field::String,
    from_zip: Field::String,
    from_city: Field::String,
    from_state: Field::String,
    from_country: Field::String,
    meta: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :to,
    :from,
    :status,
    :recording_url,
    :recognized_speech
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :to,
    :from,
    :status,
    :recording_url,
    :recognized_speech,
    :user_id,
    :parent_id,
    :meta,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :to,
    :from,
    :status,
    :recording_url,
    :recognized_speech,
  ].freeze

  # Overwrite this method to customize how calls are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(call)
  #   "Call ##{call.id}"
  # end
end
