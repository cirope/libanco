class EducationLevel < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include EducationLevels::Validation

  default_scope -> { order 'education_levels.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
