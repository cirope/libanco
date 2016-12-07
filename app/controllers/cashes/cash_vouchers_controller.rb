class Cashes::CashVouchersController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  before_action :set_cash_voucher, only: [:edit, :update, :destroy]

  # GET /cash_vouchers
  # GET /cash_vouchers.json
  def index
  end

  # GET /cash_vouchers/new
  def new
    @cash_voucher = @cash.cash_vouchers.new
    render 'form'
  end

  # GET /cash_vouchers/1/edit
  def edit
    render 'form'
  end

  # POST /cash_vouchers
  # POST /cash_vouchers.json
  def create
    @cash_voucher = @cash.cash_vouchers.new cash_voucher_params.merge(user: current_user)

    @cash_voucher.save
    render 'action'
  end

  # PATCH/PUT /cash_vouchers/1
  # PATCH/PUT /cash_vouchers/1.json
  def update
    @cash_voucher.update cash_voucher_params
    render 'action'
  end

  # DELETE /cash_vouchers/1
  # DELETE /cash_vouchers/1.json
  def destroy
    @cash_voucher.destroy
    render 'action'
  end

  private

    def set_cash_voucher
      @cash_voucher = @cash.cash_vouchers.find params[:id]
    end

    def cash_voucher_params
      params.require(:cash_voucher).permit :amount, :comment, :employee_id, :lock_version
    end
end
