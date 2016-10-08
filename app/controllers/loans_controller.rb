class LoansController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_loan, only: [:show, :edit, :update, :destroy]
  before_action :set_search_path, only: [:index, :show, :new, :edit]

  # GET /loans
  # GET /loans.json
  def index
    @loans = params[:q].present? ? Loan.search(params[:q]) : Loan.all
    @loans = @loans.includes(:customer).references(:customer).page params[:page]
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new loan_params

    if @loan.save
      redirect_to @loan
    else
      render 'new'
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    if @loan.update loan_params
      redirect_to @loan
    else
      render 'edit'
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    redirect_to loans_url
  end

  private

    def set_loan
      @loan = Loan.find params[:id]
    end

    def set_search_path
      @search_path = loans_url
    end

    def loan_params
      params.require(:loan).permit :type, :amount, :payments_count,
        :payment_frequency, :first_payment_days, :credit_line_id, :customer_id, :lock_version
    end
end
