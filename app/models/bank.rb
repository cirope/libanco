class Bank < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Banks::Validation

  default_scope -> { order 'banks.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
