module Loans::AmericanPayment
  extend ActiveSupport::Concern

  def calculate_payment
    calculate_interest

    self.payment = amount_total / payments_count + interest_amount
  end

  def calculate_interest
    self.interest_amount = amount_total * ((credit_line.interest / frequency_interest.to_f) / 100.0)
  end
end
