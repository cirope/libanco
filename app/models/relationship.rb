class Relationship < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Relationships::Validation

  default_scope -> { order 'relationships.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
