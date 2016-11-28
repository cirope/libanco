class InvoiceTypesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_invoice_type, only: [:edit, :update]

  # GET /invoice_types
  # GET /invoice_types.json
  def index
    @invoice_types = InvoiceType.page params[:page]
  end

  # GET /invoice_types/new
  def new
    @invoice_type = InvoiceType.new
  end

  # GET /invoice_types/1/edit
  def edit
  end

  # POST /invoice_types
  # POST /invoice_types.json
  def create
    @invoice_type = InvoiceType.new invoice_type_params

    if @invoice_type.save
      redirect_to invoice_types_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /invoice_types/1
  # PATCH/PUT /invoice_types/1.json
  def update
    if @invoice_type.update invoice_type_params
      redirect_to invoice_types_url
    else
      render 'edit'
    end
  end

  private

    def set_invoice_type
      @invoice_type = InvoiceType.find params[:id]
    end

    def invoice_type_params
      params.require(:invoice_type).permit :name , :lock_version
    end
end
