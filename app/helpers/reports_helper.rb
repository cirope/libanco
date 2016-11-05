module ReportsHelper
  def link_to_filter filter, icon
    classes = @report.filter == filter ? 'list-group-item active' : 'list-group-item'
    filters = params[:report].present? ? { report: params[:report].to_unsafe_h.merge(filter: filter) } : filter

    link_to fa_icon(icon, text: filter.classify.constantize.model_name.human(count: 0)),
      reports_path(filters), class: classes
  end
end
