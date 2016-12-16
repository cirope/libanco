class CashInvoice < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include CashInvoices::CashVouchers
  include CashInvoices::Relations
  include CashInvoices::Reports
  include CashInvoices::Scopes
  include CashInvoices::Validation
  include CashInvoices::Xls
  include Cashes::UpdateBalance

  strip_fields :number, :detail

  def to_s
    number
  end
end
