json.extract! supplier, :id, :status, :tax_id, :legal_name, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)