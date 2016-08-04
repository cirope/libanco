class LoanType < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include LoanTypes::Validation

  default_scope -> { order 'loan_types.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
