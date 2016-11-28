class ExpenseType < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include ExpenseTypes::Validation

  default_scope -> { order 'expense_types.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
