class Cashes::CashMemberPaymentsController < ApplicationController
  include Authentication
  include Authorization
  include Cash::Scoped
  include Title

  before_action :set_cash_member_payment, only: [:destroy]

  # GET /cash_member_payments
  # GET /cash_member_payments.json
  def index
  end

  # GET /cash_member_payments/new
  def new
    @cash_member_payment = @cash.cash_member_payments.new
    render 'form'
  end

  # POST /cash_member_payments
  # POST /cash_member_payments.json
  def create
    if params[:member_payments_ids].present?
      MemberPayment.find(params[:member_payments_ids]).each do |mp|
        @cash.cash_member_payments.create!(
          cash_member_payment_params.merge(member_payment: mp, user: current_user)
        )
      end
    else
      @cash_member_payment = @cash.cash_member_payments.new(cash_member_payment_params)
      @cash_member_payment.errors.add :base, t('cash_member_payments.errors.select_payments')
      @member_payments = @cash_member_payment.customer.member_payments.pendings
    end

    render 'action'
  end

  # DELETE /cash_member_payments/1.json
  def destroy
    @cash_member_payment.destroy
    render 'action'
  end

  private

    def set_cash_member_payment
      @cash_member_payment = @cash.cash_member_payments.find params[:id]
    end

    def cash_member_payment_params
      params.require(:cash_member_payment).permit :customer_id, :lock_version
    end
end
