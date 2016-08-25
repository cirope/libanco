module Loans::Validation
  extend ActiveSupport::Concern

  included do
    STATUSES = ['current', 'canceled', 'expired', 'judicial']
    SYSTEMS = ['french']
    FREQUENCIES = ['daily', 'weekly', 'biweekly', 'monthly']

    validates :status, :amortization_system, :credit_line_data, :payment_frequency, presence: true
    validates :status, inclusion: { in: STATUSES }, allow_nil: true, allow_blank: true
    validates :amortization_system, inclusion: { in: SYSTEMS }, allow_nil: true, allow_blank: true
    validates :payment_frequency, inclusion: { in: FREQUENCIES }, allow_nil: true, allow_blank: true
    validates :payments_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :amount, :amount_total, :payment, presence: true, numericality: { greater_than: 0 }
    validates :commission_amount, :interest_amount, :tax_amount, :tax_perception_amount,
      :gross_income_perception_amount, :insurance_amount, :stamped_amount, presence: true,
      numericality: { greater_than_or_equal_to: 0 }
    validates_date :expire_at, on_or_after: :today
  end
end
