module Loans::Payments
  extend ActiveSupport::Concern

  included do
    after_save :calculate_payments
  end

  private

    def calculate_payments
      calculate_payments_french if french?
    end

    def calculate_payments_french
      1.upto(payments_count) do |number|
        payments.create!(
          number: number,
          balance: ,
          capital: ,
          interest: ,
          tax: ,
          insurance: ,
          tax_perception: ,
          gross_income_perception: ,
          amount: ,
          expire_at:
        )
      end
    end
end
