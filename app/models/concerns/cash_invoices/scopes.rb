module CashInvoices::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'cash_invoices.created_at DESC' }
    scope :cash_discount, -> {
      joins(:payment_method).where payment_methods: { cash_discount: true }
    }
  end
end
