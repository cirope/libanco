class InvoicesController < ApplicationController
  include Authentication
  include Authorization
  include Cash::Scoped
  include Title

  before_action :set_invoice, only: [:edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = @cash.invoices.ordered
  end

  # GET /invoices/new
  def new
    @invoice = @cash.innvoices.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = @cash.invoices.new invoice_params

    if @invoice.save
      redirect_to invoices_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    if @invoice.update invoice_params
      redirect_to invoices_url
    else
      render 'edit'
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    redirect_to invoices_url
  end

  private

    def set_invoice
      @invoice = @cash.invoices.find params[:id]
    end

    def invoice_params
      params.require(:invoice).permit :date, :number, :subtotal, :tax_amount,
        :tax_perception_amount, :gross_income_perception_amount, :amount, :detail,
        :invoice_type_id, :tax_condition_id, :expense_type_id, :payment_method_id,
        :supplier_id, :lock_version
    end
end
