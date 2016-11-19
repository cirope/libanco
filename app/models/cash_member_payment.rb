class CashMemberPayment < ApplicationRecord
  include Auditable
  include Authority::Abilities

  scope :ordered, -> { order 'created_at DESC' }

  belongs_to :cash
  belongs_to :user
  belongs_to :member_payment
  has_one :customer, through: :member_payment
end
