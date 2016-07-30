json.extract! user, :id, :name, :lastname, :role_model, :created_at, :updated_at
json.url user_url(user, format: :json)