module CashVouchers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'created_at DESC' }
    scope :outcomes, -> { where(kind: 'cash_outcome').ordered.limit 10 }
    scope :systems, -> { where kind: ['cash_deficit', 'cash_surplus'] }
    scope :valids, -> { where annulled: false }
  end
end
