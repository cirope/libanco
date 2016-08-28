module Loans::Defaults
  extend ActiveSupport::Concern

  included do
    before_validation :set_defaults
    before_validation :set_credit_line_data, if: :credit_line
  end

  private

    def set_defaults
      self.expire_at = calculate_expire_at
      self.status ||= 'current'
    end

    def calculate_expire_at
      days = payments_count.to_i * payment_frequency.to_i
      days.days.from_now
    end

    def set_credit_line_data
      attrs = [
        'id', 'name', 'commission', 'interest', 'tax', 'tax_perception',
        'gross_income_perception', 'insurance', 'stamped'
      ]
      self.credit_line_data = credit_line.attributes.slice *attrs
    end
end
