module Loans::Payments
  extend ActiveSupport::Concern

  included do
    after_save :calculate_payments
  end

  private

    def calculate_payments
      payments.map(&:destroy)
      calculate_payments_french if french?
    end

    def calculate_payments_french
      last_payment = payment
      last_capital = amount_total

      1.upto(payments_count) do |number|
        interest = payment_interest(last_capital, number)
        tax = interest * percentage_of(:tax)
        insurance = last_capital * percentage_of(:insurance)
        tax_perception = (interest + tax + insurance) * percentage_of(:tax_perception)
        gross_income_perception = (interest + insurance) * percentage_of(:gross_income_perception)
        capital = last_payment - interest - tax - insurance - tax_perception - gross_income_perception
        expire_date = (number * payment_frequency).days.from_now

        payments.create!(
          number: number,
          balance: last_capital,
          capital: capital,
          interest: interest,
          tax: tax,
          insurance: insurance,
          tax_perception: tax_perception,
          gross_income_perception: gross_income_perception,
          amount: payment,
          expire_at: expire_at_corrector(expire_date)
        )

        last_capital = last_capital - capital
      end
    end

    def payment_interest last_capital, number
      if number == 1
        last_capital * percentage_of(:interest) * first_payment_days.to_i / 365.0
      else
        last_capital * percentage_of(:interest) * payment_frequency.to_i / 365.0
      end
    end
end
