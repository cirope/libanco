module Reports::Conditions
  extend ActiveSupport::Concern

  def conditions
    case filter
      when 'mp_all' then mp_all_conditions
      when 'mp_expired' then mp_expired_conditions
      when 'p_all' then p_all_conditions
      when 'p_expired' then p_expired_conditions
      when 'cash_invoice' then cash_invoice_conditions
      when 'cash_employee' then cash_employee_conditions
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

    def cash_invoice_conditions
      conditions = {}
      conditions[:date] = from.beginning_of_month..to.end_of_month
      conditions[:supplier_id] = supplier_id if supplier_id.present?
      conditions
    end

    def cash_employee_conditions
      conditions = {}
      conditions[:created_at] = from.beginning_of_month..to.end_of_month
      conditions[:employee_id] = employee_id if employee_id.present?
      conditions
    end
end
