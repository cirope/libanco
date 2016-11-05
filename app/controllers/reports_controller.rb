class ReportsController < ApplicationController
  include Authentication
  include Authorization

  before_action :set_report

  def index
    @reports = @report.model_filter.reports(
      @report.conditions
    ).page params[:page]
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
      params.require(:report).permit :filter, :date_range, :customer_id
    end
end
