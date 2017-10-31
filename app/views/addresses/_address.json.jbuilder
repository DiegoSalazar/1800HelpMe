json.extract! address, :id, :contactable_id, :contactable_type, :address_type, :primary, :street1, :street2, :city, :state, :zip, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
