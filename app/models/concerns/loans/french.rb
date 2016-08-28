module Loans::French
  extend ActiveSupport::Concern

  included do
    before_validation :set_amount_total, :calculare_insurance,
      :calculate_interest, :calculate_payment, if: :loan_french?
  end

  def calculate_payment
    self.payment = amount_total *
      (((1 + interest_amount) ** payments_count) * interest_amount) /
      (((1 + interest_amount) ** payments_count - 1))
  end

  private

    def loan_french?
      credit_line && french?
    end

    def set_amount_total
      self.amount_total = amount.to_f + calculate_commission + calculate_tax +
        calculate_tax_perception + calculate_gross_income_perception
      self.amount_total += calculate_stamped
    end

    def calculate_commission
      self.commission_amount = amount.to_f * credit_line.commission.to_f / 100.0
    end

    def calculate_tax
      self.tax_amount = commission_amount * credit_line.tax.to_f / 100.0
    end

    def calculate_gross_income_perception
      self.gross_income_perception_amount =
        commission_amount * credit_line.gross_income_perception.to_f / 100.0
    end

    def calculate_tax_perception
      self.tax_perception_amount =
        commission_amount * credit_line.tax_perception.to_f / 100.0
    end

    def calculate_stamped
      self.stamped_amount = amount_total * credit_line.stamped.to_f / 100.0
    end

    def percentage_of attr
      credit_line.send(attr) / 100.0
    end

    def calculare_insurance
      self.insurance_amount = percentage_of(:insurance)
    end

    def calculate_interest
      interest_frequency = percentage_of(:interest) * payment_frequency.to_i / 365.0

      self.interest_amount = (interest_frequency * (1 + percentage_of(:tax))) +
        insurance_amount +
        (interest_frequency + insurance_amount) * percentage_of(:tax_perception) / 2.0 +
        (interest_frequency + insurance_amount) * percentage_of(:gross_income_perception) / 10.0
    end
end
