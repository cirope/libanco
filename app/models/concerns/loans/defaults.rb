module Loans::Defaults
  extend ActiveSupport::Concern

  included do
    after_validation :set_defaults, if: :loan_valid?
    before_save :set_credit_line_data
  end

  def calculate_expire_at
    expire_date = (first_payment_days.days + payment_frequency_days(payments_count.to_i - 1)).from_now.to_date
    expire_at_corrector(expire_date)
  end

  private

    def set_defaults
      self.expire_at = calculate_expire_at
      self.status ||= 'current'
    end

    def set_credit_line_data
      attrs = [
        'id', 'name', 'commission', 'commission_max', 'interest', 'tax', 'tax_perception',
        'gross_income_perception', 'gross_income_perception_min', 'insurance', 'stamped'
      ]
      self.credit_line_data = credit_line.attributes.slice *attrs
    end
end
