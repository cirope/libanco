module CustomTemplates::Scopes
  extend ActiveSupport::Concern

  included do
    default_scope -> { order 'custom_templates.name ASC' }
    scope :customers, -> { where kind: 'Customer' }
    scope :cash_member_payments, -> { where kind: 'CashMemberPayment' }
    scope :cash_payments, -> { where kind: 'CashPayment' }
    scope :cash_employees, -> { where kind: 'CashEmployee' }
  end
end
