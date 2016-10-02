class PaymentsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_search_path, :set_loan, :set_payment

  # GET /loans/1/payments/1/edit
  def edit
  end

  # PATCH/PUT /loans/1/payments/1
  # PATCH/PUT /loans/1/payments/1.json
  def update
    @payment.update payment_params
    render 'action'
  end

  private

    def set_search_path
      @search_path = loans_url
    end

    def set_loan
      @loan = Loan.find params[:loan_id]
    end

    def set_payment
      @payment = @loan.payments.find params[:id]
    end

    def payment_params
      params.require(:payment).permit :paid_at
    end
end
