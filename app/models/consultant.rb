class Consultant < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Consultants::Validation

  default_scope -> { order 'consultants.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
