module CashInvoices::CashVouchers
  extend ActiveSupport::Concern

  included do
    before_validation :set_payment_method, if: :is_voucher
    after_save :update_cash_voucher
    after_destroy :set_cash_voucher_pending
  end

  private

    def set_payment_method
      self.payment_method = PaymentMethod.where(cash_discount: true).take
    end

    def update_cash_voucher
      if is_voucher
        cash_voucher.update_column :annulled, true
      else
        set_cash_voucher_pending
        update_column :cash_voucher_id, nil
      end
    end

    def set_cash_voucher_pending
      if cash_voucher && !cash_voucher.cash_invoices.exists?
        cash_voucher.update_column :annulled, false
      end
    end
end
