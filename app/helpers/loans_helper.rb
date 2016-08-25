module LoansHelper
  def amortization_systems
    Loan::SYSTEMS.map { |as| [t("loans.amortization_systems.#{as}"), as] }
  end

  def payment_frequencies
    Loan::FREQUENCIES.map { |pf| [t("loans.payment_frequencies.#{pf}"), pf] }
  end
end
