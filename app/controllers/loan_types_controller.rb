class LoanTypesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_loan_type, only: [:edit, :update]

  # GET /loan_types
  # GET /loan_types.json
  def index
    @loan_types = LoanType.page params[:page]
  end

  # GET /loan_types/new
  def new
    @loan_type = LoanType.new
  end

  # GET /loan_types/1/edit
  def edit
  end

  # POST /loan_types
  # POST /loan_types.json
  def create
    @loan_type = LoanType.new loan_type_params

    if @loan_type.save
      redirect_to loan_types_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /loan_types/1
  # PATCH/PUT /loan_types/1.json
  def update
    if @loan_type.update(loan_type_params)
      redirect_to loan_types_url
    else
      render 'edit'
    end
  end

  private

    def set_loan_type
      @loan_type = LoanType.find params[:id]
    end

    def loan_type_params
      params.require(:loan_type).permit :name, :initial_percentage, :annual_percentage, :lock_version
    end
end
