module Loans::French
  extend ActiveSupport::Concern

  included do
    after_validation :calculate_amount_total, :calculate_payment, if: :loan_french?
  end

  def payment_extra_interest last_capital, days
    last_capital * interest_daily_percentage * days
  end

  def payment_tax_interest extra_interest
    extra_interest.to_f * percentage_of(:tax)
  end

  def interest_daily_amount
    amount_total * interest_daily_percentage
  end

  def interest_daily_percentage
    percentage_of(:interest) / 365.0
  end

  private

    def loan_french?
      loan_valid? && french?
    end

    def calculate_payment
      calculate_insurance
      calculate_interest

      self.payment = amount_total *
        (((1 + interest_amount) ** payments_count) * interest_amount) /
        (((1 + interest_amount) ** payments_count - 1))
    end

    def calculate_first_payment_days
      coefficient = amount_total * (interest_amount / payment_frequency.to_f) * (first_payment_days - payment_frequency).abs
#      coefficient = interest_daily_amount * (first_payment_days - payment_frequency).abs

      if first_payment_days > payment_frequency
        amount_total + coefficient
      elsif first_payment_days < payment_frequency
        amount_total - coefficient
      else
        amount_total
      end
    end

    def calculate_amount_total
      calculate_commission
      calculate_tax
      calculate_stamped
      calculate_tax_perception
      calculate_gross_income_perception

      self.amount_total = amount + commission_amount + tax_amount + stamped_amount +
        tax_perception_amount + gross_income_perception_amount
    end

    def calculate_commission
      self.commission_amount = amount.to_f * percentage_of(:commission)
      self.commission_amount = credit_line.commission_max if commission_amount > credit_line.commission_max
    end

    def calculate_tax
      self.tax_amount = commission_amount * percentage_of(:tax)
    end

    def calculate_gross_income_perception
      self.gross_income_perception_amount = 0

      if commission_amount > credit_line.gross_income_perception_min
        self.gross_income_perception_amount = commission_amount * percentage_of(:gross_income_perception)
      end
    end

    def calculate_tax_perception
      self.tax_perception_amount = (commission_amount + tax_amount + stamped_amount) * percentage_of(:tax_perception)
    end

    def calculate_stamped
      self.stamped_amount = (amount + commission_amount + tax_amount) * percentage_of(:stamped)
    end

    def calculate_insurance
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
