class Institution < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Institutions::Validation

  default_scope -> { order 'institutions.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
