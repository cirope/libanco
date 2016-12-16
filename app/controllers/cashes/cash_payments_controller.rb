class Cashes::CashPaymentsController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  before_action :set_cash_payment, only: [:destroy]

  # GET /cash_payments
  # GET /cash_payments.json
  def index
  end

  # GET /cash_payments/new
  def new
    @cash_payment = @cash.cash_payments.new
    render 'form'
  end

  # GET /cash_payments/1/edit
  def edit
  end

  # POST /cash_payments
  # POST /cash_payments.json
  def create
    if params[:payments_ids].present?
      Payment.find(params[:payments_ids]).each do |p|
        @cash.cash_payments.create!(
          cash_payment_params.merge(payment: p, user: current_user)
        )
      end
    else
      @cash_payment = @cash.cash_payments.new(cash_payment_params)
      @cash_payment.errors.add :base, t('cash_payments.errors.select_payments')
      @payments = @cash_payment.customer.payments.pendings
    end

    render 'action'
  end

  # DELETE /cash_payments/1
  # DELETE /cash_payments/1.json
  def destroy
    @cash_payment.destroy
    render 'action'
  end

  private

    def set_cash_payment
      @cash_payment = @cash.cash_payments.find params[:id]
    end

    def cash_payment_params
      params.require(:cash_payment).permit :customer_id, :cash_id
    end
end
