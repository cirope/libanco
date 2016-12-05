module Invoices::Reports
  extend ActiveSupport::Concern

  module ClassMethods
    def reports conditions
      includes(:supplier).where(conditions).order('date DESC').references(:supplier)
    end

    def summary reports
      { total: ActionController::Base.helpers.number_to_currency(reports.sum(:amount)) }
    end
  end
end
