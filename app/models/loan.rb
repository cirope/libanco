class Loan < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Loans::Defaults
  include Loans::French
  include Loans::Validation
  include Loans::Relations

  default_scope -> { order 'loans.created_at DESC' }
end
