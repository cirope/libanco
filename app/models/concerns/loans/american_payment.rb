module Loans::AmericanPayment
  extend ActiveSupport::Concern

  def calculate_payment
    calculate_interest

    self.payment = amount_total / payments_count + interest_amount
  end

  def calculate_interest
    self.interest_amount = amount_total * percentage_of(:interest)
  end
end
