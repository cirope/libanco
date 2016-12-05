class Report
  include ActiveModel::Model
  include Authority::Abilities

  attr_accessor :filter, :date_range, :from, :to, :customer, :customer_id,
    :supplier, :supplier_id

  def initialize params = {}
    parse_date_range params[:date_range]

    self.filter = params[:filter].present? ? params[:filter] : 'mp_all'
    self.customer = params[:customer].blank? ? nil : params[:customer]
    self.customer_id = params[:customer_id].blank? ? nil : params[:customer_id]
    self.supplier = params[:supplier].blank? ? nil : params[:supplier]
    self.supplier_id = params[:supplier_id].blank? ? nil : params[:supplier_id]
  end

  def model_filter
    case filter
      when 'mp_all', 'mp_expired' then 'member_payment'
      when 'p_all', 'p_expired' then 'payment'
      when 'invoice' then 'invoice'
    end
  end

  def conditions
    case filter
      when 'mp_all' then mp_all_conditions
      when 'mp_expired' then mp_expired_conditions
      when 'p_all' then p_all_conditions
      when 'p_expired' then p_expired_conditions
      when 'invoice' then invoice_conditions
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
      conditions[:customer_id] = customer_id if customer_id.present?
      conditions[:paid_at] = nil
      conditions
    end

    def p_all_conditions
      conditions = {}
      conditions[:created_at] = from.beginning_of_month..to.end_of_month
      conditions[:loans] = { customer_id: customer_id } if customer_id.present?
      conditions
    end

    def p_expired_conditions
      conditions = {}
      conditions[:expire_at] = from.beginning_of_month..to.end_of_month
      conditions[:loans] = { customer_id: customer_id } if customer_id.present?
      conditions[:paid_at] = nil
      conditions
    end

    def invoice_conditions
      conditions = {}
      conditions[:date] = from.beginning_of_month..to.end_of_month
      conditions[:supplier_id] = supplier_id if supplier_id.present?
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
