module LoansHelper
  def amortization_systems
    Loan::SYSTEMS.map { |as| [t("loans.amortization_systems.#{as}"), as] }
  end

  def payment_frequencies
    Loan::FREQUENCIES.map { |k, v| [t("loans.payment_frequencies.#{k}"), v] }
  end
end
