module CashVouchers::Validation
  extend ActiveSupport::Concern

  included do
    KINDS = {
      cash_deficit: { type: 'system', owner: 'User', incout: 'income' },
      cash_surplus: { type: 'system', owner: 'User', incout: 'outcome' },
      capital_customer: { type: 'manual', owner: 'Customer', incout: 'income' },
      remittance_income: { type: 'manual', owner: 'BankAccount', incout: 'income' },
      remittance_outcome: { type: 'manual', owner: 'BankAccount', incout: 'outcome' },
      cash_outcome: { type: 'manual', owner: 'Employee', incout: 'outcome' }
    }

    validates :kind, presence: true, inclusion: { in: KINDS.keys.map(&:to_s) }
    validates :amount, presence: true, numericality: true
    validates :comment, presence: true
  end
end
