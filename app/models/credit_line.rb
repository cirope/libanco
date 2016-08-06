class CreditLine < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include CreditLines::Validation

  default_scope -> { order 'credit_lines.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
