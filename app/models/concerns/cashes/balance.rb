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

  def invoices_sum
    invoices.sum :amount
  end

  private

    def calculate_difference
      self.difference = balance.to_f - closing_balance.to_f
    end

    def total_incomes
      opening_balance.to_f + cash_member_payments_sum + cash_payments_sum
    end

    def total_outcomes
      invoices.cash_discount.sum :amount
    end
end
