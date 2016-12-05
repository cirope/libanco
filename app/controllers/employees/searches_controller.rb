class Employees::SearchesController < ApplicationController
  include Authentication

  def index
    @employees = Employee.active.search(params[:q]).limit 10
  end
end
