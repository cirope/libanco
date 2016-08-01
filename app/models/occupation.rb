class Occupation < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Occupations::Validation

  default_scope -> { order 'occupations.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
