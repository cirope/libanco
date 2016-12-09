module CashInvoices::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'cash_invoices.created_at DESC' }
    scope :outcomes, -> {
      joins(:payment_method).where cash_voucher: nil, payment_methods: { cash_discount: true }
    }
    scope :incomes, -> { where.not cash_voucher: nil }
  end
end
