module Reports::Defaults
  extend ActiveSupport::Concern

  def initialize params = {}
    parse_date_range params[:date_range]

    self.filter = params[:filter].present? ? params[:filter] : 'mp_all'
    self.customer = params[:customer].blank? ? nil : params[:customer]
    self.customer_id = params[:customer_id].blank? ? nil : params[:customer_id]
    self.supplier = params[:supplier].blank? ? nil : params[:supplier]
    self.supplier_id = params[:supplier_id].blank? ? nil : params[:supplier_id]
    self.employee = params[:employee].blank? ? nil : params[:employee]
    self.employee_id = params[:employee_id].blank? ? nil : params[:employee_id]
  end

  private

    def parse_date_range date_range
      begin
        self.from = date_range.split('-')[0].to_date
        self.to   = date_range.split('-')[1].to_date
      rescue
        self.from = Date.parse '01-01-2000'
        self.to   = Date.today.end_of_month
      end
      self.date_range = "#{I18n.l(from)} - #{I18n.l(to)}"
    end
end
