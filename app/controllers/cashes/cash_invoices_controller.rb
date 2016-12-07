class Cashes::CashInvoicesController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  before_action :set_cash_invoice, only: [:edit, :update, :destroy]

  # GET /cash_invoices
  # GET /cash_invoices.json
  def index
  end

  # GET /cash_invoices/new
  def new
    @cash_invoice = @cash.cash_invoices.new
    render 'form'
  end

  # GET /cash_invoices/1/edit
  def edit
    render 'form'
  end

  # POST /cash_invoices
  # POST /cash_invoices.json
  def create
    @cash_invoice = @cash.cash_invoices.new cash_invoice_params.merge(user: current_user)

    @cash_invoice.save
    render 'action'
  end

  # PATCH/PUT /cash_invoices/1
  # PATCH/PUT /cash_invoices/1.json
  def update
    @cash_invoice.update cash_invoice_params
    render 'action'
  end

  # DELETE /cash_invoices/1
  # DELETE /cash_invoices/1.json
  def destroy
    @cash_invoice.destroy
    render 'action'
  end

  private

    def set_cash_invoice
      @cash_invoice = @cash.cash_invoices.find params[:id]
    end

    def cash_invoice_params
      params.require(:cash_invoice).permit :date, :number, :subtotal, :tax_amount,
        :tax_perception_amount, :gross_income_perception_amount, :amount, :detail,
        :invoice_type_id, :tax_condition_id, :expense_type_id, :payment_method_id,
        :supplier_id, :lock_version
    end
end
