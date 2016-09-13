module Loans::Defaults
  extend ActiveSupport::Concern

  included do
    after_validation :set_defaults, if: :loan_valid?
    before_create :set_credit_line_data
  end

  def calculate_expire_at
    expire_days = payments_count.to_i * payment_frequency.to_i
    expire_at_corrector(expire_days.days.from_now)
  end

  private

    def set_defaults
      self.expire_at = calculate_expire_at
      self.status ||= 'current'
    end

    def set_credit_line_data
      attrs = [
        'id', 'name', 'commission', 'interest', 'tax', 'tax_perception',
        'gross_income_perception', 'insurance', 'stamped'
      ]
      self.credit_line_data = credit_line.attributes.slice *attrs
    end
end
