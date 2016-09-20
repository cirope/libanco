module Loans::Scopes
  extend ActiveSupport::Concern

  def french?
    amortization_system == 'french'
  end

  def percentage_of attr
    credit_line.send(attr).to_f / 100.0
  end

  def expire_at_corrector expire_date
    expire_date.on_weekend? ? expire_date.next_week : expire_date
  end

  def loan_valid?
    errors.blank?
  end

  def simulate_valid?
    self.simulator = true
    valid?
  end
end
