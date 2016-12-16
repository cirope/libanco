class Cashes::CashEmployeesController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  before_action :set_cash_employee, only: [:edit, :update, :destroy]

  # GET /cash_employees
  # GET /cash_employees.json
  def index
  end

  # GET /cash_employees/new
  def new
    @cash_employee = @cash.cash_employees.new
    render 'form'
  end

  # GET /cash_employees/1/edit
  def edit
    render 'form'
  end

  # POST /cash_employees
  # POST /cash_employees.json
  def create
    @cash_employee = @cash.cash_employees.new cash_employee_params.merge(user: current_user)

    @cash_employee.save
    render 'action'
  end

  # PATCH/PUT /cash_employees/1
  # PATCH/PUT /cash_employees/1.json
  def update
    @cash_employee.update cash_employee_params
    render 'action'
  end

  # DELETE /cash_employees/1
  # DELETE /cash_employees/1.json
  def destroy
    @cash_employee.destroy
    render 'action'
  end

  private

    def set_cash_employee
      @cash_employee = @cash.cash_employees.find params[:id]
    end

    def cash_employee_params
      params.require(:cash_employee).permit :period, :amount, :employee_id, :lock_version
    end
end
