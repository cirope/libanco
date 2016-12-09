class BankAccount < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include BankAccounts::Validation

  strip_fields :account, :cbu

  belongs_to :bank, optional: true

  def to_s
    [bank, account].join ' - '
  end
end
