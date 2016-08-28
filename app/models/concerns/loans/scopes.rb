module Loans::Scopes
  extend ActiveSupport::Concern

  def french?
    amortization_system == 'french'
  end

  def percentage_of attr
    credit_line.send(attr) / 100.0
  end
end
