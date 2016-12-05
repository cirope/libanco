class ReportsController < ApplicationController
  include Authentication
  include Authorization

  before_action :set_report

  def index
    model = @report.model_filter.classify.constantize

    @reports = model.reports @report.conditions
    @summary = model.summary @reports

    @reports = @reports.page params[:page]
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
        :supplier, :supplier_id
    end
end
