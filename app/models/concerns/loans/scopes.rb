module Loans::Scopes
  extend ActiveSupport::Concern

  def french?
    amortization_system == 'french'
  end

  def percentage_of attr
    credit_line.send(attr).to_f / 100.0
  end

  def expire_at_corrector expire_date
    while expire_date.holiday?(:ar) || expire_date.on_weekend? do
      expire_date += 1.day
    end
    expire_date
  end

  def loan_valid?
    errors.blank?
  end

  def payment_frequency_days number
    case payment_frequency
    when 30 then number.months
    else number * payment_frequency.days
    end
  end

  def simulate_valid?
    self.simulator = true
    valid?
  end
end
