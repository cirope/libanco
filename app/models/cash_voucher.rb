class CashVoucher < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Cashes::UpdateBalance
  include CashVouchers::Relations
  include CashVouchers::Scopes
  include CashVouchers::Templates
  include CashVouchers::Validation

  strip_fields :comment

  def to_s
    owner
  end
end
