class HeaderTemplate < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include HeaderTemplates::Validation

  default_scope -> { order 'header_templates.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
