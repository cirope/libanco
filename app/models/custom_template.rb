class CustomTemplate < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include CustomTemplates::Relations
  include CustomTemplates::Validation

  default_scope -> { order 'custom_templates.name ASC' }

  strip_fields :name

  def templates
    content = ''
    body_templates.each { |bt| content += bt.content }
    content
  end

  def to_s
    name
  end
end
