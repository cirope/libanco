class Nacionality < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Nacionalities::Validation

  default_scope -> { order 'nacionalities.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
