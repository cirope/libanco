class FooterTemplate < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include FooterTemplates::Validation

  default_scope -> { order 'footer_templates.name ASC' }

  strip_fields :name, :content

  def to_s
    name
  end
end
