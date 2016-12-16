class PaymentMethodsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_payment_method, only: [:edit, :update]

  # GET /payment_methods
  # GET /payment_methods.json
  def index
    @payment_methods = PaymentMethod.page params[:page]
  end

  # GET /payment_methods/new
  def new
    @payment_method = PaymentMethod.new
  end

  # GET /payment_methods/1/edit
  def edit
  end

  # POST /payment_methods
  # POST /payment_methods.json
  def create
    @payment_method = PaymentMethod.new payment_method_params

    if @payment_method.save
      redirect_to payment_methods_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /payment_methods/1
  # PATCH/PUT /payment_methods/1.json
  def update
    if @payment_method.update payment_method_params
      redirect_to payment_methods_url
    else
      render 'edit'
    end
  end

  private

    def set_payment_method
      @payment_method = PaymentMethod.find params[:id]
    end

    def payment_method_params
      params.require(:payment_method).permit :name, :cash_discount, :lock_version
    end
end
