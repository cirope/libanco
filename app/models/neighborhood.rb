class Neighborhood < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Neighborhoods::Validation

  default_scope -> { order 'neighborhoods.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
