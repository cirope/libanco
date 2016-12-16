module CashInvoices::Xls
  extend ActiveSupport::Concern

  module ClassMethods
    def to_xls reports
      xls   = StringIO.new
      book  = Spreadsheet::Workbook.new
      sheet = book.create_worksheet name: model_name.human(count: 0)

      sheet.row(0).concat [
        human_attribute_name('created_at'),
        human_attribute_name('user'),
        human_attribute_name('date'),
        human_attribute_name('invoice_type'),
        human_attribute_name('number'),
        human_attribute_name('supplier'),
        human_attribute_name('tax_condition'),
        human_attribute_name('payment_method'),
        human_attribute_name('amount'),
        human_attribute_name('detail')
      ]

      reports.each do |report|
        report_row = [
          I18n.l(report.created_at),
          report.user.to_s,
          I18n.l(report.date),
          report.invoice_type.to_s,
          report.number,
          report.supplier.to_s,
          report.tax_condition.to_s,
          report.payment_method.to_s,
          report.amount,
          report.detail
        ]

        sheet.insert_row (sheet.last_row_index+1), report_row
      end
      book.write xls

      xls
    end
  end
end
