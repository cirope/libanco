module Loans::AmericanPayments
  extend ActiveSupport::Concern

  def calculate_payments
    payments.map(&:destroy)
    interest = interest_amount
    last_capital = amount_total

    1.upto(payments_count) do |number|
      tax = interest * percentage_of(:tax)
      extra_interest = number == 1 ? payment_extra_interest(last_capital, (first_payment_days - payment_frequency).abs) : 0
      tax_interest = number == 1 ? payment_tax_interest(extra_interest) : 0
      insurance = last_capital * percentage_of(:insurance)
      tax_perception = (interest + tax + insurance) * percentage_of(:tax_perception)
      gross_income_perception = payment_gross_income_perception(interest + insurance)
      capital = payment - interest - tax - insurance - tax_perception - gross_income_perception
      expire_date = expire_at_corrector(payment_expire_at(number))

      payments.create!(
        number: number,
        balance: last_capital,
        capital: capital,
        interest: (interest - extra_interest),
        tax: (tax - tax_interest),
        extra_interest: extra_interest.to_f,
        tax_interest: tax_interest.to_f,
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
