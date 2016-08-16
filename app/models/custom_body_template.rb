class CustomBodyTemplate < ApplicationRecord
  include Auditable
  include Authority::Abilities

  default_scope -> { order 'custom_body_templates.created_at ASC' }

  belongs_to :custom_template, optional: true
  belongs_to :body_template
end
