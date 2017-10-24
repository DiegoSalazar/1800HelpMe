json.extract! contact, :id, :user_id, :first_name, :middle_name, :last_name, :email, :phone, :created_at, :updated_at
json.url contact_url(contact, format: :json)
