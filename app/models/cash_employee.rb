class CashEmployee < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Cashes::UpdateBalance
  include CashEmployees::Relations
  include CashEmployees::Validation

  delegate :tax_id, to: :employee

  scope :ordered, -> { order 'created_at DESC' }
end
