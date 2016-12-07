module CashVouchers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'cash_vouchers.created_at DESC' }
  end
end
