class Report
  include ActiveModel::Model
  include Authority::Abilities

  attr_accessor :filter, :date_range, :from, :to, :customer, :customer_id

  def initialize params = {}
    parse_date_range params[:date_range]

    self.filter = params[:filter].present? ? params[:filter] : 'mp_all'
    self.customer_id = params[:customer_id].blank? ? nil : params[:customer_id]
    self.customer = params[:customer].blank? ? nil : params[:customer]
  end

  def model_filter
    case filter
      when 'mp_all', 'mp_expired' then 'member_payment'
    end
  end

  def conditions
    case filter
      when 'mp_all' then mp_all_conditions
      when 'mp_expired' then mp_expired_conditions
    end
  end

  private

    def mp_all_conditions
      conditions = {}
      conditions[:period] = from.beginning_of_month..to.end_of_month
      conditions[:customer_id] = customer_id if customer_id.present?
      conditions
    end

    def mp_expired_conditions
      conditions = {}
      conditions[:period] = from.beginning_of_month..to.end_of_month
      conditions[:expire_at] = from.beginning_of_month..Date.today
      conditions[:paid_at] = nil
      conditions
    end

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
