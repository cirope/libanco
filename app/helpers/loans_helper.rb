module LoansHelper
  def amortization_systems
    Loan::TYPES.map { |as| [t("loans.types.#{as}"), as] }
  end

  def payment_frequencies
    Loan::FREQUENCIES.map { |k, v| [t("loans.payment_frequencies.#{k}"), v] }
  end

  def t_loan_type loan
    t "loans.types.#{loan.type}"
  end
end
