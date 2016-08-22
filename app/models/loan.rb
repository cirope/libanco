class Loan < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Loans::Defaults
  include Loans::Validation

  default_scope -> { order 'loans.created_at DESC' }

  belongs_to :customer
end
