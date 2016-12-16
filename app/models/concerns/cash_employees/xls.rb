module CashEmployees::Xls
  extend ActiveSupport::Concern

  module ClassMethods
    def to_xls reports
      xls   = StringIO.new
      book  = Spreadsheet::Workbook.new
      sheet = book.create_worksheet name: model_name.human(count: 0)

      sheet.row(0).concat [
        human_attribute_name('created_at'),
        human_attribute_name('user'),
        human_attribute_name('employee'),
        human_attribute_name('period'),
        human_attribute_name('amount')
      ]

      reports.each do |report|
        report_row = [
          I18n.l(report.created_at),
          report.user.to_s,
          report.employee.to_s,
          I18n.l(report.period, format: :period),
          report.amount
        ]

        sheet.insert_row (sheet.last_row_index+1), report_row
      end
      book.write xls

      xls
    end
  end
end
