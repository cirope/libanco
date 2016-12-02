class MemberPaymentsController < ApplicationController
  include Authentication

  before_action :set_customer

  # GET /member_payments
  # GET /member_payments.json
  def index
    @member_payments = @customer.member_payments.pendings
  end

  private

    def set_customer
      @customer = Customer.find params[:customer_id]
    end
end
