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
      last_capital = amount_total
      last_expire_date = nil 

      1.upto(payments_count) do |number|
        interest = payment_interest(number, last_capital)
        tax = interest * percentage_of(:tax)
        extra_interest = number == 1 ? payment_extra_interest(last_capital, first_payment_days - payment_frequency) : 0
        tax_interest = number == 1 ? payment_tax_interest(extra_interest) : 0
        insurance = last_capital * percentage_of(:insurance)
        tax_perception = (interest + tax + insurance) * percentage_of(:tax_perception)
        gross_income_perception = payment_gross_income_perception(interest + insurance)
        capital = payment - interest - tax - insurance - tax_perception - gross_income_perception
        last_expire_date = expire_at_corrector(payment_expire_at(number, last_expire_date))

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
          expire_at: last_expire_date
        )

        last_capital -= capital
      end
    end

    def payment_interest number, last_capital
      coefficient = number == 1 ? first_payment_days : payment_frequency
      last_capital * percentage_of(:interest) * coefficient / 365.0
    end

    def payment_gross_income_perception coefficient
      coefficient > credit_line.gross_income_perception_min ?
        coefficient * percentage_of(:gross_income_perception) : 0
    end

    def payment_expire_at number, last_expire_date
      number == 1 ? first_payment_days.days.from_now : (last_expire_date + payment_frequency.days)
    end
end
