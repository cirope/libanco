class Loans::SimulatorController < ApplicationController
  include Authentication

  def index
    @loan = Loan.new loan_params
  end

  private

    def loan_params
      params.require(:loan).permit :amortization_system, :amount, :payments_count,
        :payment_frequency, :first_payment_days, :credit_line_id
    end
end
