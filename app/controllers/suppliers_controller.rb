class SuppliersController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_supplier, only: [:edit, :update]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.page params[:page]
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new supplier_params

    if @supplier.save
      redirect_to suppliers_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    if @supplier.update supplier_params
      redirect_to suppliers_url
    else
      render 'edit'
    end
  end

  private

    def set_supplier
      @supplier = Supplier.find params[:id]
    end

    def supplier_params
      params.require(:supplier).permit :tax_id, :legal_name, :lock_version
    end
end
