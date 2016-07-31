class EducationLevel < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include EducationLevels::Validation

  strip_fields :name

  def to_s
    name
  end
end
