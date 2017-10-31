json.extract! phone_number, :id, :contactable_id, :contactable_type, :number, :phone_type, :primary, :created_at, :updated_at
json.url phone_number_url(phone_number, format: :json)
