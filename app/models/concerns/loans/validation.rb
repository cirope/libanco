module Loans::Validation
  extend ActiveSupport::Concern

  included do
    STATUSES = ['current', 'canceled', 'expired', 'judicial']
    SYSTEMS = ['french']
    FREQUENCIES = {
      'daily': 1,
      'weekly': 7,
      'biweekly': 15,
      'monthly': 30
    }

    validates :amortization_system, :payment_frequency, presence: true
    validates :amortization_system, inclusion: { in: SYSTEMS }, allow_nil: true, allow_blank: true
    validates :payment_frequency, inclusion: { in: FREQUENCIES.values }, allow_nil: true, allow_blank: true
    validates :payments_count, :first_payment_days, presence: true,
      numericality: { only_integer: true, greater_than: 0 }
    validates :amount, presence: true, numericality: { greater_than: 0 }

    with_options unless: :simulator do |loan|
      loan.validates :customer, presence: true
    end
  end
end
