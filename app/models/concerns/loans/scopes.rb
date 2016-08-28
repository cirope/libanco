module Loans::Scopes
  extend ActiveSupport::Concern

  def french?
    amortization_system == 'french'
  end
end
