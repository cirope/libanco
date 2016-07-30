json.extract! account, :id, :name, :subdomain, :lock_version, :created_at, :updated_at
json.url account_url(account, format: :json)