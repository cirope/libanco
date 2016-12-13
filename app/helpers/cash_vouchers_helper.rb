module CashVouchersHelper
  def cash_voucher_kinds
    CashVoucher::KINDS.select { |k, v| v[:type] == 'manual' }.map do |k, v|
      [
        t("cash_vouchers.kinds.#{k}"), k,
        data: {
          owner_searches: url_for([v[:owner].underscore.pluralize, 'searches']),
          owner_type: v[:owner]
        }
      ]
    end
  end

  def owner_searches_url cash_voucher
    if cash_voucher.kind.present?
      url_for [
        CashVoucher::KINDS[cash_voucher.kind.to_sym][:owner].underscore.pluralize, 'searches'
      ]
    end
  end

  def cash_vouchers_outcomes
    CashVoucher.outcomes.ordered.map { |cv| [cv, cv.id] }
  end
end
