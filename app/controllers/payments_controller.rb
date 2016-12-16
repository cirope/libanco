class PaymentsController < ApplicationController
  include Authentication

  before_action :set_customer

  # GET /member_payments
  # GET /member_payments.json
  def index
    @payments = @customer.payments.pendings
  end

  private

    def set_customer
      @customer = Customer.find params[:customer_id]
    end
end
