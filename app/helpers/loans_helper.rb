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

  def link_to_new_loan_schedule loan
    link_to fa_icon('calendar'), new_loan_schedule_path(loan), data: { remote: true }
  end
end
