module CashVouchers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'created_at DESC' }
    scope :outcomes, -> { where(kind: 'cash_outcome').limit 10 }
  end
end
