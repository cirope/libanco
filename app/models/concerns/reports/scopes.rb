module Reports::Scopes
  extend ActiveSupport::Concern

  def model_filter
    case filter
      when 'mp_all', 'mp_expired' then 'member_payment'
      when 'p_all', 'p_expired' then 'payment'
      when 'cash_invoice' then 'cash_invoice'
      when 'cash_employee' then 'cash_employee'
    end
  end
end
