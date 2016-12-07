class CashVoucher < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Cashes::UpdateBalance
  include CashVouchers::Defaults
  include CashVouchers::Relations
  include CashVouchers::Reports
  include CashVouchers::Scopes
  include CashVouchers::Validation

  strip_fields :comment

  def to_s
    [employee, ActionController::Base.helpers.number_to_currency(amount), comment].join(' - ')
  end
end
