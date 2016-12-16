module CashMemberPayments::MemberPayments
  extend ActiveSupport::Concern

  included do
    after_create :paid_member_payment
    after_destroy :unpaid_member_payment
  end

  private

    def paid_member_payment
      member_payment.update_column :paid_at, created_at
    end

    def unpaid_member_payment
      member_payment.update_column :paid_at, nil
    end
end
