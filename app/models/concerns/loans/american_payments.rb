module Loans::AmericanPayments
  extend ActiveSupport::Concern

  def calculate_payments
    payments.map(&:destroy)
    last_capital = amount_total

    1.upto(payments_count) do |number|
      tax = interest_amount * percentage_of(:tax)
      insurance = last_capital * percentage_of(:insurance)
      tax_perception = (interest_amount + tax + insurance) * percentage_of(:tax_perception)
      gross_income_perception = payment_gross_income_perception(interest_amount + insurance)
      capital = payment - interest_amount - tax - insurance - tax_perception - gross_income_perception
      expire_date = expire_at_corrector(payment_expire_at(number))

      payments.create!(
        number: number,
        balance: last_capital,
        capital: capital,
        interest: interest_amount,
        tax: tax_amount,
        insurance: insurance,
        tax_perception: tax_perception,
        gross_income_perception: gross_income_perception,
        amount: payment,
        expire_at: expire_date
      )

      last_capital -= capital
    end
  end
end
