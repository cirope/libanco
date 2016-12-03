module Cashes::Balance
  extend ActiveSupport::Concern

  included do
    before_update :set_counts
  end

  def balance
    incomes_count.to_f - outcomes_count.to_f
  end

  def difference
    final_count.to_f - closing_balance.to_f
  end

  def total_incomes
    opening_balance.to_f + cash_member_payments_sum
  end

  def total_outcomes
    invoices.cash_discount.sum :amount
  end

  def cash_member_payments_sum
    member_payments.sum :amount
  end

  def invoices_sum
    invoices.sum :amount
  end

  private

    def set_counts
      self.incomes_count = total_incomes
      self.outcomes_count = total_outcomes
      self.final_count = balance
    end
end
