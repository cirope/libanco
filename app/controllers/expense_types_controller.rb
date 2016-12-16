class ExpenseTypesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_expense_type, only: [:edit, :update]

  # GET /expense_types
  # GET /expense_types.json
  def index
    @expense_types = ExpenseType.page params[:page]
  end

  # GET /expense_types/new
  def new
    @expense_type = ExpenseType.new
  end

  # GET /expense_types/1/edit
  def edit
  end

  # POST /expense_types
  # POST /expense_types.json
  def create
    @expense_type = ExpenseType.new expense_type_params

    if @expense_type.save
      redirect_to expense_types_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /expense_types/1
  # PATCH/PUT /expense_types/1.json
  def update
    if @expense_type.update expense_type_params
      redirect_to expense_types_url
    else
      render 'edit'
    end
  end

  private

    def set_expense_type
      @expense_type = ExpenseType.find params[:id]
    end

    def expense_type_params
      params.require(:expense_type).permit :name, :lock_version
    end
end
