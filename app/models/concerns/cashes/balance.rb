module Cashes::Balance
  extend ActiveSupport::Concern

  included do
    before_update :calculate_difference
  end

  def update_balance
    self.incomes_count = total_incomes
    self.outcomes_count = total_outcomes
    self.balance = incomes_count.to_f - outcomes_count.to_f

    update_columns(
      incomes_count: incomes_count, outcomes_count: outcomes_count, balance: balance
    )
  end

  def cash_member_payments_sum
    member_payments.sum :amount
  end

  def cash_payments_sum
    payments.sum :amount
  end

  def cash_employees_sum
    cash_employees.sum :amount
  end

  def cash_invoices_sum
    cash_invoices.outcomes.sum :amount
  end

  def cash_vouchers_sum
    (cash_vouchers_outcome_sum - cash_vouchers_income_sum).abs
  end

  private

    def cash_vouchers_income_sum
      cash_vouchers.valids.select { |cv| CashVoucher::KINDS[cv.kind.to_sym][:incout] == 'income' }.map(&:amount).sum
    end

    def cash_vouchers_outcome_sum
      cash_vouchers.valids.select { |cv| CashVoucher::KINDS[cv.kind.to_sym][:incout] == 'outcome' }.map(&:amount).sum
    end

    def calculate_difference
      self.difference = closing_balance.to_f - balance.to_f
    end

    def total_incomes
      opening_balance.to_f + cash_member_payments_sum + cash_payments_sum + cash_vouchers_income_sum
    end

    def total_outcomes
      cash_employees_sum + cash_invoices_sum + cash_vouchers_outcome_sum
    end
end
