class Report
  include ActiveModel::Model
  include Authority::Abilities

  attr_accessor :filter, :date_range, :from, :to, :customer, :customer_id

  def initialize params = {}
    parse_date_range params[:date_range]

    self.filter ||= 'member_payment'
  end

  def model_filter
    filter.classify.constantize if filter.present?
  end

  def conditions
    case filter
      when 'member_payment' then member_payments_conditions
    end
  end

  def member_payment?
    filter == 'member_payment'
  end

  private

    def member_payments_conditions
      conditions = {}
      conditions[:period] = from.beginning_of_month..to.end_of_month
      conditions[:customer_id] = customer_id if customer_id.present?
      conditions
    end

    def parse_date_range date_range
      begin
        self.from = date_range.split('-')[0].to_date
        self.to   = date_range.split('-')[1].to_date
      rescue
        self.from = Date.today.beginning_of_month
        self.to   = Date.today.end_of_month
      end
      self.date_range = "#{I18n.l(from)} - #{I18n.l(to)}"
    end
end
