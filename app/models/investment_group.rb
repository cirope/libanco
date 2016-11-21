class InvestmentGroup < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include InvestmentGroups::Validation

  default_scope -> { order 'investment_groups.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
