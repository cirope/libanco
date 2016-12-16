class TaxCondition < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include TaxConditions::Validation

  default_scope -> { order 'tax_conditions.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
