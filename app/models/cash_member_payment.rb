class CashMemberPayment < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include CashMemberPayments::MemberPayments
  include CashMemberPayments::Relations

  delegate :amount, :expire_at, :paid_at, :period, to: :member_payment

  scope :ordered, -> { order 'created_at DESC' }
end
