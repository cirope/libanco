class Loan < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Loans::Defaults
  include Loans::Relations
  include Loans::Scopes
  include Loans::Validation
  include SearchCop

  attr_accessor :simulator

  search_scope :search do
    attributes customer: ['customer.name', 'customer.lastname', 'customer.identification']
  end

  delegate :address, :phone, :cellphone, to: :customer, allow_nil: false

  default_scope -> { order 'loans.created_at DESC' }
end
