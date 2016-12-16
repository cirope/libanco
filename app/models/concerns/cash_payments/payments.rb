module CashPayments::Payments
  extend ActiveSupport::Concern

  included do
    after_create :paid_payment
    after_destroy :unpaid_payment
  end

  private

    def paid_payment
      payment.update_column :paid_at, created_at
    end

    def unpaid_payment
      payment.update_column :paid_at, nil
    end
end
