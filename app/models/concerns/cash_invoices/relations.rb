module CashInvoices::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :cash
    belongs_to :cash_voucher, optional: true
    belongs_to :expense_type
    belongs_to :invoice_type
    belongs_to :payment_method
    belongs_to :supplier
    belongs_to :tax_condition
    belongs_to :user
  end
end
