class MaritalStatus < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include MaritalStatuses::Validation

  strip_fields :name

  def to_s
    name
  end
end
