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

  def show_loan_frequency loan
    t "loans.payment_frequencies.#{Loan::FREQUENCIES.key(loan.payment_frequency)}"
  end
end
