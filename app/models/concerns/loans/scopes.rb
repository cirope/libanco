module Loans::Scopes
  extend ActiveSupport::Concern

  def frequency_interest
    case payment_frequency.to_i
    when 30 then 12
    when 15 then 24
    when 7 then 48
    when 1 then 365
    end
  end

  def has_schedule_pending?
    schedules.any? { |s| !s.done }
  end

  def credit_line_data attribute
    data['credit_line'][attribute]
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
    when 30 then number.months.from_now.to_date
    else (number * payment_frequency).days.from_now.to_date
    end
  end

  def simulate_valid?
    self.simulator = true
    valid?
  end

  def payment_extra_interest last_capital, days
    last_capital * interest_daily_percentage * days
  end

  def payment_tax_interest extra_interest
    extra_interest.to_f * percentage_of(:tax)
  end

  def interest_daily_amount
    amount_total * interest_daily_percentage
  end

  def interest_daily_percentage
    percentage_of(:interest) / 365.0
  end

  def payment_gross_income_perception coefficient
    coefficient > credit_line.gross_income_perception_min ?
      coefficient * percentage_of(:gross_income_perception) : 0
  end

  def payment_expire_at number
    payment_frequency_days number
  end
end
