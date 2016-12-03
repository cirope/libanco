module Invoices::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'invoices.created_at DESC' }
    scope :cash_discount, -> {
      joins(:payment_method).where payment_methods: { cash_discount: true }
    }
  end
end
