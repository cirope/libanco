class Cashes::CashMemberPaymentsController < ApplicationController
  include Authentication
  include Authorization
  include Cash::Scoped
  include Title

  before_action :set_cash_member_payment, only: [:show, :edit, :update, :destroy]

  # GET /cash_member_payments
  # GET /cash_member_payments.json
  def index
    @cash_member_payments = @cash.cash_member_payments.ordered
  end

  # GET /cash_member_payments/new
  def new
    @cash_member_payment = @cash.cash_member_payments.new
    render 'action'
  end

  # GET /cash_member_payments/1/edit
  def edit
    render 'action'
  end

  # POST /cash_member_payments
  # POST /cash_member_payments.json
  def create
    @cash_member_payment = @cash.cash_member_payments.new(
      cash_member_payment_params.merge(user: current_user)
    )

    if @cash_member_payment.save
      render 'index'
    else
      render 'action'
    end
  end

  # PATCH/PUT /cash_member_payments/1
  # PATCH/PUT /cash_member_payments/1.json
  def update
    if @cash_member_payment.update cash_member_payment_params
      render 'index'
    else
      render 'action'
    end
  end

  # DELETE /cash_member_payments/1
  # DELETE /cash_member_payments/1.json
  def destroy
    @cash_member_payment.destroy
    render 'index'
  end

  private

    def set_cash_member_payment
      @cash_member_payment = @cash.cash_member_payments.find params[:id]
    end

    def cash_member_payment_params
      params.require(:cash_member_payment).permit :member_payment_id, :lock_version
    end
end
