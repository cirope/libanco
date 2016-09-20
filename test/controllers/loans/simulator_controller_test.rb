require 'test_helper'

class Loans::SimulatorControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans :default

    login
  end

  test 'should get index' do
    get loans_simulator_url, xhr: true, params: {
      loan: {
        amortization_system: @loan.amortization_system,
        amount: @loan.amount,
        payments_count: @loan.payments_count,
        payment_frequency: @loan.payment_frequency,
        first_payment_days: @loan.first_payment_days,
        credit_line_id: @loan.credit_line_id
      }
    }
    assert_response :success
  end
end
