json.extract! body_template, :id, :name, :content, :created_at, :updated_at
json.url body_template_url(body_template, format: :json)