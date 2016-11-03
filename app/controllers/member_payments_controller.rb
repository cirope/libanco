class MemberPaymentsController < ApplicationController
  before_action :set_member_payment, only: [:show, :edit, :update, :destroy]

  # GET /member_payments
  # GET /member_payments.json
  def index
    @member_payments = MemberPayment.all
  end

  # GET /member_payments/1
  # GET /member_payments/1.json
  def show
  end

  # GET /member_payments/new
  def new
    @member_payment = MemberPayment.new
  end

  # GET /member_payments/1/edit
  def edit
  end

  # POST /member_payments
  # POST /member_payments.json
  def create
    @member_payment = MemberPayment.new(member_payment_params)

    respond_to do |format|
      if @member_payment.save
        format.html { redirect_to @member_payment, notice: 'Member payment was successfully created.' }
        format.json { render :show, status: :created, location: @member_payment }
      else
        format.html { render :new }
        format.json { render json: @member_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_payments/1
  # PATCH/PUT /member_payments/1.json
  def update
    respond_to do |format|
      if @member_payment.update(member_payment_params)
        format.html { redirect_to @member_payment, notice: 'Member payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_payment }
      else
        format.html { render :edit }
        format.json { render json: @member_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_payments/1
  # DELETE /member_payments/1.json
  def destroy
    @member_payment.destroy
    respond_to do |format|
      format.html { redirect_to member_payments_url, notice: 'Member payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_payment
      @member_payment = MemberPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_payment_params
      params.require(:member_payment).permit(:amount, :paid_at, :expire_at, :customer_id)
    end
end
