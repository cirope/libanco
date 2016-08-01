class MaritalStatus < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include MaritalStatuses::Validation

  default_scope -> { order 'marital_statuses.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
