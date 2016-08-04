json.extract! loan_type, :id, :name, :initial_percentage, :annual_percentage, :created_at, :updated_at
json.url loan_type_url(loan_type, format: :json)