module MemberPayments::Xls
  extend ActiveSupport::Concern

  module ClassMethods
    def to_xls reports
      xls   = StringIO.new
      book  = Spreadsheet::Workbook.new
      sheet = book.create_worksheet name: model_name.human(count: 0)

      sheet.row(0).concat [
        Customer.human_attribute_name('code'),
        human_attribute_name('customer'),
        Customer.human_attribute_name('card'),
        human_attribute_name('period'),
        human_attribute_name('expire_at'),
        human_attribute_name('paid_at'),
        human_attribute_name('amount')
      ]

      reports.each do |report|
        report_row = [
          report.customer.code,
          report.customer.to_s,
          report.customer.card.to_s,
          I18n.l(report.period, format: :period),
          I18n.l(report.expire_at),
          I18n.t("member_payments.payments.#{(report.paid_at ? 'paid' : 'unpaid')}"),
          report.amount
        ]

        sheet.insert_row (sheet.last_row_index+1), report_row
      end
      book.write xls

      xls
    end
  end
end
