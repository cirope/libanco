class BankAccount < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include BankAccounts::Validation
  include SearchCop

  belongs_to :bank, optional: true

  strip_fields :account, :cbu

  search_scope :search do
    attributes :account, :cbu
    attributes bank: ['bank.name']
  end

  def to_s
    [bank, account].join ' - '
  end
end
