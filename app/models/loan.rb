class Loan < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Loans::Defaults
  include Loans::French
  include Loans::Payments
  include Loans::Relations
  include Loans::Scopes
  include Loans::Validation

  default_scope -> { order 'loans.created_at DESC' }
end
