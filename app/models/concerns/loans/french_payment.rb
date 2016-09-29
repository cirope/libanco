module Loans::FrenchPayment
  extend ActiveSupport::Concern

  def calculate_payment
    calculate_insurance
    calculate_interest

    self.payment = calculate_first_payment_days *
      (((1 + interest_amount) ** payments_count) * interest_amount) /
      (((1 + interest_amount) ** payments_count - 1))
  end

  def calculate_first_payment_days
    coefficient = interest_daily_amount * (first_payment_days - payment_frequency).abs
    coefficient += coefficient * percentage_of(:tax)

    if first_payment_days > payment_frequency
      amount_total + coefficient
    elsif first_payment_days < payment_frequency
      amount_total - coefficient
    else
      amount_total
    end
  end

  def calculate_insurance
    self.insurance_amount = percentage_of(:insurance)
  end

  def calculate_interest
    interest_monthly = percentage_of(:interest) * payment_frequency.to_i / 365.0
    interest_monthly_tax = interest_monthly * (1 + percentage_of(:tax))

    self.interest_amount = interest_monthly_tax + insurance_amount +
      (interest_monthly + insurance_amount) * percentage_of(:tax_perception) / 2.0 +
      (interest_monthly + insurance_amount) * percentage_of(:gross_income_perception) / 10.0
  end
end
