class CashPayment < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Cashes::UpdateBalance
  include CashPayments::Payments
  include CashPayments::Relations
  include CashPayments::Templates

  delegate :number, :amount, :expire_at, :paid_at, to: :payment

  scope :ordered, -> { order 'created_at DESC' }
end
