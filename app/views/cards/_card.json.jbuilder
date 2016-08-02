json.extract! card, :id, :name, :admission_fee, :monthly_fee, :created_at, :updated_at
json.url card_url(card, format: :json)