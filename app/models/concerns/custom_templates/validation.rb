module CustomTemplates::Validation
  extend ActiveSupport::Concern

  included do
    KINDS = {
      customer: 'Customer',
      cash_member_payment: 'CashMemberPayment',
      cash_payment: 'CashPayment',
      cash_employee: 'CashEmployee',
      capital_customer: 'CashVoucher',
      remittance_income: 'CashVoucher',
      remittance_outcome: 'CashVoucher',
      cash_outcome: 'CashVoucher'
    }

    validates :content, presence: true
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      presence: true
    validates :kind, presence: true, inclusion: { in: KINDS.keys.map(&:to_s) }
  end
end
