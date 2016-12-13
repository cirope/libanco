module CashInvoices::CashVouchers
  extend ActiveSupport::Concern

  included do
    before_validation :set_payment_method, if: :is_voucher
    after_save :update_cash_voucher
  end

  private

    def set_payment_method
      self.payment_method = PaymentMethod.where(cash_discount: true).take
    end

    def update_cash_voucher
      update_column :cash_voucher_id, nil if !is_voucher
    end
end
