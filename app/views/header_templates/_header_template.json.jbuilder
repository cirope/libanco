json.extract! header_template, :id, :name, :content, :image, :created_at, :updated_at
json.url header_template_url(header_template, format: :json)