class CashInvoice < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Cashes::UpdateBalance
  include CashInvoices::Relations
  include CashInvoices::Reports
  include CashInvoices::Scopes
  include CashInvoices::Validation

  strip_fields :number, :detail

  def to_s
    number
  end
end
