module Cashes::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def current_cash
      where(status: 'opened').take
    end
  end

  included do
    scope :ordered, -> { order 'created_at DESC' }
  end

  def opened?
    status == 'opened'
  end

  def unlock!
    cash_vouchers.systems.map &:destroy
    update status: 'opened'
  end

  def difference_status
    if difference >= 100
      'cash_surplus'
    elsif difference <= -100
      'cash_deficit'
    end
  end

  def cash_voucher_system parameters
    cash_vouchers.create!(
      kind: difference_status,
      amount: difference_amount,
      owner: parameters[:current_user],
      comment: parameters[:comment],
      user: parameters[:current_user]
    )
  end

  private

    def difference_amount
      case difference_status
      when 'cash_surplus' then difference * -1
      when 'cash_deficit' then difference
      end
    end
end
