class ReportsController < ApplicationController
  include Authentication
  include Authorization

  before_action :set_report

  def index
    model = @report.model_filter.classify.constantize

    @reports = model.reports @report.conditions
    @summary = model.summary @reports

    respond_to do |format|
      format.html { @reports = @reports.page params[:page] }
      format.xls {
        xls = model.to_xls @reports
        send_data xls.string, filename: "#{model.model_name.human(count: 0)}.xls",
          disposition: :inline
      }
    end
  end

  private

    def set_report
      @report =
        if params[:report].present?
          Report.new reports_params
        else
          Report.new
        end
    end

    def reports_params
      params.require(:report).permit :filter, :date_range, :customer, :customer_id,
        :supplier, :supplier_id, :employee, :employee_id
    end
end
