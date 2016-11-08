module ReportsHelper
  def link_to_filter filter
    classes = @report.filter == filter ? 'list-group-item active' : 'list-group-item'
    filters = params[:report].present? ? { report: params[:report].to_unsafe_h.merge(filter: filter) } : { report: { filter: filter } }

    link_to t("reports.menu.#{filter}"), reports_path(filters), class: classes
  end
end
