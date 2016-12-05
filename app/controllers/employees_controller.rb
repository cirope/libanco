class EmployeesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_employee, only: [:edit, :update]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.page params[:page]
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new employee_params

    if @employee.save
      redirect_to employees_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    if @employee.update employee_params
      redirect_to employees_url
    else
      render 'edit'
    end
  end

  private

    def set_employee
      @employee = Employee.find params[:id]
    end

    def employee_params
      params.require(:employee).permit :name, :lastname, :tax_id, :lock_version
    end
end
